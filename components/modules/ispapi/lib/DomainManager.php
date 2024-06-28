<?php

namespace HEXONET\MODULE\LIB;

class DomainManager extends Base
{
    /**
     * get domain status
     * @param array $params common module parameters
     * @param string $dnszone puny code dnszone name
     * @return array
     */
    public function getDNSList($row, $dnszone)
    {
        if (!preg_match("/\.$/", $dnszone)) {
            $dnszone .= ".";
        }
        // DANGER! statusdnszone resolves for "hidden" dnszones
        // which are not visible to CP (QueryDNSZoneList command)
        $r = $this->call([
            "COMMAND" => "QueryDNSZoneList",
            "DNSZONE" => $dnszone
        ], $row);
        if ($r["CODE"] !== "200") {
            return [
                "success" => false,
                "error" => "Loading dnszone status failed. (" . $r["CODE"] . " " . $r["DESCRIPTION"] . ")",
                "CODE" => $r["CODE"]
            ];
        }
        if ($r["PROPERTY"]["COUNT"][0] === "0") {
            return [
                "success" => false,
                "error" => "Object not found or hidden.",
                "CODE" => "545"
            ];
        }
        return [
            "success" => true,
            "data" => $r["PROPERTY"]
        ];
    }

    public function createDNSZone($domain)
    {
        // Prepare the domain for DNS Zone Creation
        $this->call([
            "COMMAND" => "ModifyDomain",
            "DOMAIN" => $domain,
            "INTERNALDNS" => 1
        ]);

        // Create non hidden DNS Zone
        return $this->call([
            "COMMAND" => "CreateDNSZone",
            "DNSZONE" => "{$domain}.",
            "EXTERNAL" => 0
        ]);
    }

    public function getDNSZoneRRList($domain)
    {
        return $this->call([
            "COMMAND" => "QueryDNSZoneRRList",
            "DNSZONE" => "{$domain}.",
            "EXTENDED" => 1,
            "SHORT" => 1
        ]);
    }

    public function getDomainStatus($domain)
    {
        return $this->call([
            "COMMAND" => "StatusDomain",
            "DOMAIN" => $domain,
            "HOSTTYPE" => "ATTRIBUTE"
        ]);
    }

    public function getDomainStatusCached($domain)
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
     * @param string|array<string,string> $domains Single domain or array of domains.
     * @return object|array<object> Zone information per TLD.
     */
    public function getZoneInfo($domains)
    {
        $isSingleDomain = false;

        // If a single domain is passed, convert it to an array
        if (!is_array($domains)) {
            $domains = [$domains];
            $isSingleDomain = true;
        }

        // Initialize arrays for return and TLDs to query
        $return = [];
        $tldsToQuery = [];

        // Check and load cache for each domain's TLD
        foreach ($domains as $idx => $domain) {
            list($sld, $tld) = explode(".", $domain, 2);
            // Only load cache if TLD result hasn't been retrieved yet
            if (!isset($return[$tld])) {
                // Check if cache exists for the TLD
                $cache = false;//Helper::hasCache("{$tld}_options");

                if ($cache) {
                    // Cache found, add to return directly
                    $return[$tld] = $cache;
                } else {
                    // Cache not found, mark TLD for query
                    $tldsToQuery[$idx] = $domain;
                }
            }
        }

        // Prepare the bulk request payload
        $payload = ["COMMAND" => "QueryDomainOptions"];
        foreach ($tldsToQuery as $idx => $domain) {
            $payload["DOMAIN{$idx}"] = $domain;
        }

        // Send the bulk request if there are TLDs to query
        if (count($tldsToQuery) > 0) {
            $response = $this->call($payload);
            // Process the bulk response
            foreach ($tldsToQuery as $idx => $domain) {
                $tldData = [];
                list($sld, $tld) = explode(".", $domain, 2);

                if ($response["CODE"] === "200") {
   
                    // Process response properties for renewal, registration, transfer
                    $transferPeriods = Helper::parsePeriods($response["PROPERTY"]["ZONETRANSFERPERIODS"][$idx]);
                    $renewalPeriods = Helper::parsePeriods($response["PROPERTY"]["ZONERENEWALPERIODS"][$idx]);
                    $registrationPeriods = Helper::parsePeriods($response["PROPERTY"]["ZONEREGISTRATIONPERIODS"][$idx]);

                    // Build the tld data structure
                    $tldData["renewal"]["periods"] = $renewalPeriods;
                    $tldData["renewal"]["defaultPeriod"] = $renewalPeriods[0] ?? -1;

                    $tldData["registration"]["periods"] = $registrationPeriods;
                    $tldData["registration"]["defaultPeriod"] = $registrationPeriods[0] ?? -1;

                    $tldData["transfer"]["periods"] = $transferPeriods;
                    $tldData["transfer"]["defaultPeriod"] = $transferPeriods[0] ?? -1;
                    $tldData["transfer"]["isFree"] = in_array("0", $transferPeriods);

                    $tldData["addons"]["IDProtection"] = in_array("WHOISTRUSTEE", explode(" ", $response["PROPERTY"]["X-PROXY"][$idx]));

                    // Cache the result for this TLD
                    $tldData = Helper::setCache("{$tld}_options", $tldData);
                    
                    // Update return array with the processed data
                    $return[$tld] = $tldData;
                }
            }
        }

        // Return data based on single or multiple domain input
        if ($isSingleDomain && !empty($domains[0])) {
            list(, $tld) = explode(".", $domains[0], 2);
            return $return[$tld];
        }

        return $return ?? $response;
    }

    public function getDomainRepositoryInfo($domain)
    {
        return $this->call([
            "COMMAND" => "QueryDomainRepositoryInfo",
            "DOMAIN" => $domain
        ]);
    }

    public function addDNS($domain, $postData)
    {
        $record = Helper::getResourceRecord($postData);
        return $this->call([
            "COMMAND" => "UpdateDNSZone",
            "DNSZONE" => "{$domain}.",
            "ADDRR0" => "{$record}"
        ]);
    }

    public function deleteDNS($dns, $postData)
    {
        return $this->call([
            "COMMAND" => "UpdateDNSZone",
            "DNSZONE" => "{$dns}.",
            "DELRR0" => "{$postData['raw_record']}"
        ]);
    }

    public function getEmailForwardingRR($domain)
    {
        $response = $this->call([
            "COMMAND" => "QueryDNSZoneRRList",
            "DNSZONE" => "{$domain}.",
            "EXTENDED" => 1,
            "SHORT" => 1,
            "RRTYPE" => "X-SMTP"
        ]);

        if ($response["CODE"] !== "200") {
            return $response;
        }

        $addresses = [];
        if ((int) $response["PROPERTY"]["TOTAL"][0] > 0) {
            foreach ($response["PROPERTY"]["RR"] as $rr) {
                $fields = explode(" ", $rr);
                if (
                    // MAILFORWARD Identifier
                    ($fields[5] !== "MAILFORWARD")
                    // prefix
                    || !(bool)preg_match("/^(.*)\@$/", $fields[4], $m)
                ) {
                    continue;
                }
                $addresses[] = [
                    "source" => (strlen($m[1])) ? $m[1] : "*",
                    "destination" => $fields[6]
                ];
            }
        }

        return array_merge($response, ["resources" => $addresses]);
    }

    public function saveEmailForwardingRR($domain, $postData, $action = "ADD")
    {
        // If add new resource request
        $resourceType = "ADDRR";

        if ($action === "DELETE") {
            $delData = explode(" ", $postData['delete']);
            $postData["source"] = $delData[0];
            $postData["destination"] = $delData[1];
            // If delete resource request
            $resourceType = "DELRR";
        }

        $command = [
            "COMMAND" => "UpdateDNSZone",
            "DNSZONE" => "{$domain}.",
            "RESOLVETTLCONFLICTS" => 1,
            "INCSERIAL" => 1,
            "EXTENDED" => 1,
            $resourceType => [],
        ];

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

        $command[$resourceType][] = "@ X-SMTP $source@ MAILFORWARD $destination";

        return $this->call($command);
    }

    public function registerNameserver($domain, $postData)
    {
        return $this->call([
            "COMMAND" => "AddNameserver",
            "NAMESERVER" => "{$postData['new_nameserver']}.{$domain}",
            "IPADDRESS0" => $postData["new_nameserver_ip"]
        ]);
    }

    public function deleteNameserver($nameserver)
    {
        return $this->call([
            "COMMAND" => "DeleteNameserver",
            "NAMESERVER" => "{$nameserver}"
        ]);
    }

    public function addDnssecRecord($domain, $postData, $type = "DS")
    {
        $command = [
            "COMMAND" => "ModifyDomain",
            "DOMAIN" => $domain
        ];
        if ($type === "DS") {
            $command["ADDSECDNS-DS0"] = $postData['key_tag'] . " " . $postData['algorithm'] . " " . $postData['digest_type'] . " " . $postData['digest'];
        } else {
            $command["ADDSECDNS-KEY0"] = $postData['flags'] . " " . $postData['protocol'] . " " . $postData['algorithm'] . " " . $postData['public_key'];
        }
        return $this->call($command);
    }

    public function deleteDnssecRecord($domain, $postData, $type = "DS")
    {
        $command = [
            "COMMAND" => "ModifyDomain",
            "DOMAIN" => $domain
        ];

        if ($type === "DS") {
            $command["DELSECDNS-DS0"] = $postData['key_tag'] . " " . $postData['algorithm'] . " " . $postData['digest_type'] . " " . $postData['digest'];
        } else {
            $command["DELSECDNS-KEY0"] = $postData['flags'] . " " . $postData['protocol'] . " " . $postData['algorithm'] . " " . $postData['public_key'];
        }
        return $this->call($command);
    }

    public function getTldData()
    {
        return $this->call([
            "COMMAND" => "StatusUser",
            "PROPERTIES" => "TLDDATA"
        ]);
    }
}
