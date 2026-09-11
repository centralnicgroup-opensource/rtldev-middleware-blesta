<?php

class CnrDomainManager extends CnrBase
{
    /** @var int Zones per QueryZoneInformationList call */
    private const ZONE_INFO_CHUNK_SIZE = 30;

    /** @return array<string, mixed> */
    public function createDNSZone(string $domain): array
    {
        // The zone alone does not serve anything: the domain has to delegate to
        // the nameservers that host it, or records added here are never
        // answered. ModifyDomain without a NAMESERVER did nothing at all.
        $command = [
            "COMMAND" => "ModifyDomain",
            "DOMAIN" => $domain,
        ];
        foreach (array_values(CnrModuleSettings::fromRow(self::getModule())->dnsNameservers) as $i => $host) {
            $command["NAMESERVER{$i}"] = $host;
        }
        $this->call($command);

        return $this->call([
            "COMMAND" => "AddDNSZone",
            "DNSZONE" => $domain
        ]);
    }

    /** @return array<string, mixed> */
    public function getDNSZoneRRList(string $domain): array
    {
        return $this->call([
            "COMMAND" => "QueryDNSZoneRRList",
            "DNSZONE" => "{$domain}",
            "WIDE" => 1,
            "ORDERBY" => "type"
        ]);
    }

    /** @return array<string, mixed> */
    public function getDomainStatus(string $domain): array
    {
        return $this->call([
            "COMMAND" => "StatusDomain",
            "DOMAIN" => $domain,
            "X-FEE-COMMAND" => "renew"
        ]);
    }

    /** @return array<string, mixed> */
    public function getDomainStatusCached(string $domain): array
    {
        return $this->call([
            "COMMAND" => "QueryDomainList",
            "DOMAIN" => $domain,
            "WIDE" => "1"
        ]);
    }

    /**
     * Retrieve zone information for TLDs.
     *
     * A single domain is resolved with one GetZoneInfo call. A list of domains is
     * resolved through QueryZoneInformationList in chunks, because one call per
     * domain would be hundreds of requests. The API rejects a whole chunk when it
     * does not recognise one of the zones, so that zone is dropped and the chunk
     * is retried.
     *
     * Results are cached per TLD, so only the TLDs missing from the cache are
     * requested.
     *
     * @param string|array<int, string> $domains Single domain or list of domains.
     * @return CnrZoneInfo|array<string, CnrZoneInfo>|null Zone information for the
     *  single domain, or a map of tld => zone information.
     */
    public function getZoneInfo(string|array $domains): CnrZoneInfo|array|null
    {
        $isSingleDomain = !is_array($domains);
        $domains = $isSingleDomain ? [$domains] : $domains;

        $return = [];
        $tldsToQuery = [];

        // Resolve what the cache already holds, collect the TLDs still missing
        foreach ($domains as $domain) {
            if (empty($domain) || strpos((string) $domain, ".") === false) {
                continue;
            }

            list(, $tld) = explode(".", (string) $domain, 2);
            $tld = strtolower($tld);
            if (isset($return[$tld]) || isset($tldsToQuery[$tld])) {
                continue;
            }

            $cache = CnrHelper::hasCache("{$tld}_options");
            if ($cache) {
                $return[$tld] = CnrZoneInfo::fromCache($cache);
                continue;
            }

            $tldsToQuery[$tld] = $domain;
        }

        if (!empty($tldsToQuery)) {
            $return += $isSingleDomain
                ? $this->fetchZoneInfo($tldsToQuery)
                : $this->fetchZoneInfoList(array_keys($tldsToQuery));
        }

        if ($isSingleDomain) {
            list(, $tld) = explode(".", (string) $domains[0], 2);
            return $return[strtolower($tld)] ?? null;
        }

        return $return;
    }

    /**
     * Fetch zone information one TLD at a time with GetZoneInfo.
     *
     * @param array<string, string> $tldsToQuery Map of tld => example domain
     * @return array<string, CnrZoneInfo> Map of tld => zone information
     */
    private function fetchZoneInfo(array $tldsToQuery): array
    {
        $return = [];

        foreach ($tldsToQuery as $tld => $domain) {
            $response = $this->call([
                "COMMAND" => "GetZoneInfo",
                "DOMAIN" => $domain
            ]);

            if (($response["CODE"] ?? null) !== "200") {
                continue;
            }

            $return[$tld] = $this->buildZoneData($response["PROPERTY"], 0, $tld, $domain);
        }

        return $return;
    }

    /**
     * Fetch zone information for many TLDs at once with QueryZoneInformationList.
     *
     * The command is keyed by zone, not by TLD, and the two are frequently not
     * the same string: "com.ai" is registerable but its zone is "ai". Asking for
     * the TLD name would have the API reject it as an unknown zone, which costs
     * roughly half of the catalogue, so the TLDs are resolved to their zone first
     * and each zone's data is then applied to every TLD that belongs to it.
     *
     * @param array<int, string> $tlds TLDs to look up, without a leading dot
     * @return array<string, CnrZoneInfo> Map of tld => zone information
     */
    private function fetchZoneInfoList(array $tlds): array
    {
        $return = [];
        $zoneMap = $this->getTldZoneMap();

        // Group the requested TLDs by the zone that describes them
        $tldsByZone = [];
        foreach ($tlds as $tld) {
            $tldsByZone[$zoneMap[$tld] ?? $tld][] = $tld;
        }

        foreach (array_chunk(array_keys($tldsByZone), self::ZONE_INFO_CHUNK_SIZE) as $chunk) {
            do {
                $retry = false;
                $response = $this->call([
                    "COMMAND" => "QueryZoneInformationList",
                    "ZONE" => $chunk
                ]);

                // The API rejects the entire chunk over a single zone it does not
                // know about. Drop that zone and ask again for the remainder,
                // otherwise one unknown zone costs us the whole chunk.
                if (($response["CODE"] ?? null) !== "200"
                    && preg_match("/Unknown zone (.+)$/i", (string) ($response["error"] ?? ""), $match)
                ) {
                    $remaining = array_values(array_diff($chunk, [strtolower(trim($match[1]))]));
                    // Only retry when the named zone was actually one we asked
                    // for. If it was not, retrying would send the same chunk
                    // again and loop forever.
                    $retry = count($remaining) < count($chunk) && !empty($remaining);
                    $chunk = $remaining;
                }
            } while ($retry);

            if (($response["CODE"] ?? null) !== "200" || empty($response["PROPERTY"]["ZONE"])) {
                continue;
            }

            foreach ($response["PROPERTY"]["ZONE"] as $idx => $zone) {
                $zone = strtolower(trim($zone));
                // One zone can back several registerable TLDs, and each of them
                // needs its own label, cache entry and TLD specific checks.
                foreach ($tldsByZone[$zone] ?? [$zone] as $tld) {
                    $return[$tld] = $this->buildZoneData($response["PROPERTY"], $idx, $tld, "example.{$tld}");
                }
            }
        }

        return $return;
    }

    /**
     * Map every registerable TLD to the zone that describes it.
     *
     * QueryZoneList reports the registerable suffixes of a zone in its 3RDS
     * column, which is also where getTlds() takes its TLD list from, so the two
     * stay in step.
     *
     * @return array<string, string> Map of tld => zone, both without a leading dot
     */
    private function getTldZoneMap(): array
    {
        $cached = CnrHelper::hasCache("tld_zone_map", true);
        if ($cached) {
            return $cached;
        }

        $response = $this->getZoneList();
        if (($response["CODE"] ?? null) !== "200") {
            return [];
        }

        $map = [];
        foreach ($response["PROPERTY"]["ZONE"] ?? [] as $idx => $zone) {
            $zone = strtolower(trim($zone));
            foreach (explode(",", $response["PROPERTY"]["3RDS"][$idx] ?? "") as $tld) {
                $tld = strtolower(trim($tld));
                if ($tld !== "") {
                    $map[$tld] = $zone;
                }
            }
        }

        CnrHelper::setCache("tld_zone_map", $map);

        return $map;
    }

    /**
     * Build the zone information for one row of an API response and cache it.
     *
     * @param array<string, array<int, string>> $props Response properties
     * @param int $idx Index of the row to read
     * @param string $tld TLD the row describes, without a leading dot
     * @param string $domain A domain of that TLD, for the TLD specific checks
     */
    private function buildZoneData(array $props, int $idx, string $tld, string $domain): CnrZoneInfo
    {
        $zone = CnrZoneInfo::fromApi($props, $idx, $tld, $domain);
        CnrHelper::setCache("{$tld}_options", $zone->toArray());

        return $zone;
    }

    /**
     * @param array<string, mixed> $postData
     * @return array<string, mixed>
     */
    public function addDNS(string $domain, array $postData): array
    {
        $ttl = CnrModuleSettings::fromRow(self::getModule())->defaultTtl;
        $record = CnrHelper::getResourceRecord($postData, $domain, $ttl);

        // Forwarding records come back as the record array carrying an RD/MRD
        // type; everything else comes back as one or more ready made zone lines.
        if (is_array($record)
            && array_key_exists("record_type", $record)
            && in_array($record["record_type"], ["RD", "MRD"], true)
        ) {
            return $this->call([
                "COMMAND" => "AddWebFwd",
                "source" => $record["hostname"],
                "target" => $record["address"],
                "type" => $record["record_type"]
            ]);
        }

        $command = [
            "COMMAND" => "ModifyDNSZone",
            "DNSZONE" => $domain,
        ];
        // An MXE record for an IP expands to two lines (the MX and its A record),
        // so the lines are numbered rather than assumed to be a single ADDRR0.
        foreach (array_values((array) $record) as $i => $line) {
            $command["ADDRR{$i}"] = (string) $line;
        }

        return $this->call($command);
    }

    /**
     * @param array<string, mixed> $postData
     * @return array<string, mixed>
     */
    public function deleteDNS(string $domain, array $postData): array
    {
        if ($postData["raw_record"] == "URL" || $postData["raw_record"] == "FRAME") {
            return $this->call([
            "COMMAND" => "DeleteWebFwd",
            "source" => $domain
            ]);
        }
        return $this->call([
            "COMMAND" => "ModifyDNSZone",
            "DNSZONE" => "{$domain}",
            "DELRR0" => "{$postData['raw_record']}"
        ]);
    }

    /** @return array<string, mixed> */
    public function getEmailForwardingRR(string $domain): array
    {
        $response = $this->call([
            "COMMAND" => "QueryMailFwdList",
            "DNSZONE" => "{$domain}"
        ]);

        if ($response["CODE"] !== "200") {
            return $response;
        }

        $addresses = [];
        for ($i = 0; $i < $response["PROPERTY"]['TOTAL'][0]; $i++) {
            $from = explode("@", $response["PROPERTY"]['FROM'][$i]);
            $addresses[$i] = [
                'source' => $from[0],
                'destination' => $response["PROPERTY"]['TO'][$i]
            ];
        }

        return array_merge($response, ["resources" => $addresses]);
    }

    /**
     * @param array<string, mixed> $postData
     * @return array<string, mixed>
     */
    public function saveEmailForwardingRR(string $domain, array $postData, string $action = "ADD_RECORD"): array
    {
        // If add new resource request
        $actionType = "AddMailFwd";

        $command = [
            "COMMAND" => $actionType
        ];

        if ($action === "DELETE_RECORD") {
            $delData = explode(" ", $postData['delete']);
            $postData["source"] = $delData[0];
            $postData["destination"] = $delData[1];
            // If delete resource request
            $command["COMMAND"] = "DeleteMailFwd";
        }

        $source = $postData["source"];
        $destination = $postData["destination"];
        if (!strlen($source) || !strlen($destination)) {
            return [
                "CODE" => "404",
                "error" => "Email Source or the destination is missing!"
            ];
        }

        // Get the part of the source before the '@' symbol
        $prefix = strstr($source, '@', true);

        // If the source is "*", set it to an empty string
        $source = $source === "*" ? "" : ($prefix ?: $source);

        $command["from"] = "{$source}@{$domain}";
        $command["to"] = $destination;

        return $this->call($command);
    }

    /**
     * @param array<string, mixed> $postData
     * @return array<string, mixed>
     */
    public function registerNameserver(string $domain, array $postData): array
    {
        return $this->call([
            "COMMAND" => "AddNameserver",
            "NAMESERVER" => "{$postData['new_nameserver']}.{$domain}",
            "IPADDRESS0" => $postData["new_nameserver_ip"]
        ]);
    }

    /** @return array<string, mixed> */
    public function deleteNameserver(string $nameserver): array
    {
        return $this->call([
            "COMMAND" => "DeleteNameserver",
            "NAMESERVER" => "{$nameserver}"
        ]);
    }

    /**
     * @param array<string, mixed> $postData
     * @return array<string, mixed>
     */
    public function addDnssecRecord(string $domain, array $postData, string $type = "DS"): array
    {
        $command = [
            "COMMAND" => "ModifyDomain",
            "DOMAIN" => $domain
        ];
        if ($type === "DS") {
            $command["DNSSECDSDATA0"] = $postData['key_tag'] . " " . $postData['algorithm'] . " " . $postData['digest_type'] . " " . $postData['digest'];
        } else {
            $command["DNSSEC0"] = $postData['flags'] . " " . $postData['protocol'] . " " . $postData['algorithm'] . " " . $postData['public_key'];
        }
        return $this->call($command);
    }

    /**
     * @param array<string, mixed> $postData
     * @return array<string, mixed>
     */
    public function deleteDnssecRecord(string $domain, array $postData, string $type = "DS"): array
    {
        $command = [
            "COMMAND" => "ModifyDomain",
            "DOMAIN" => $domain
        ];
        $command["DNSSECDELALL"] = 1;
        return $this->call($command);
    }

    /** @return array<string, mixed> */
    public function getUserData(): array
    {
        return $this->call([
            "COMMAND" => "StatusAccount"
        ]);
    }


    /** @return array<string, mixed> */
    public function getZoneList(): array
    {
        return $this->call([
            "COMMAND" => "QueryZoneList"
        ]);
    }

    /** @return array<string, mixed> */
    public function setDomainRenewalMode(string $domain, string $mode): array
    {
        return $this->call([
            "COMMAND" => "SetDomainRenewalMode",
            "DOMAIN" => $domain,
            "RENEWALMODE" => CnrRenewalMode::fromName($mode)->value
        ]);
    }

    /** @return array<string, mixed> */
    public function nameserverList(string $domain): array
    {
        return $this->call([
            "COMMAND" => "QueryNameserverList",
            "PARENTDOMAIN" => $domain,
            "WIDE" => 1
        ]);
    }

    /** @return array<string, mixed> */
    public function addWebFwd(string $hostName, string $address, bool $isUrl): array
    {
        $command["COMMAND"] = "AddWebFwd";
        $command["source"] = $hostName;
        $command["target"] = $address;
        $command["type"] = $isUrl ? "RD" : "MRD";

        return $this->call($command);
    }

    /** @return array<string, mixed> */
    public function delWebFwd(string $hostName): array
    {
        $command["COMMAND"] = "DeleteWebFwd";
        $command["source"] = $hostName;

        return $this->call($command);
    }

    /**
     * @param array<string, mixed> $params
     * @return array<string, mixed>
     */
    public function getAdditionalFields(array $params): array
    {
        $command["COMMAND"] = "QueryCommandSyntax";
        $command["DOMAIN"] = $params["domain"];
        switch ($params["type"]) {
            case "modify":
            case "trade":
            case "transfer":
                $command["COMMANDNAME"] = ucfirst($params["type"]) . "Domain";
                break;
            default:
                $command["COMMANDNAME"] = "AddDomain";
                break;
        }
        //$command["NEWFORMAT"] = 1;
        return $this->call($command);
    }
}
