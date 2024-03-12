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
        $r = Util::call([
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

    public function getDomainOptions($domain)
    {
        list($sld, $tld) = explode(".", $domain, 2);
        $cache = Helper::hasCache("{$tld}_options");
        if ($cache) {
            $cache->cached = true;
            return $cache;
        }

        $response = $this->call([
            "COMMAND" => "QueryDomainOptions",
            "DOMAIN0" => $domain
        ]);

        $return = [];

        if ($response["CODE"] === "200") {
            $transferPeriods = empty($response["PROPERTY"]["ZONETRANSFERPERIODS"][0]) ? [] : preg_replace("/(^R|Y$)/", "", preg_grep("/^R?(\d+)Y$/", explode(",", $response["PROPERTY"]["ZONETRANSFERPERIODS"][0])));
            $renewalPeriods = empty($response["PROPERTY"]["ZONERENEWALPERIODS"][0]) ? [] : preg_replace("/(^R|Y$)/", "", preg_grep("/^R?(\d+)Y$/", explode(",", $response["PROPERTY"]["ZONERENEWALPERIODS"][0])));

            $return["renewal"]["periods"] = $renewalPeriods;
            $return["renewal"]["defaultPeriod"] = $renewalPeriods[0] ?? -1;

            $return["transfer"]["periods"] = $transferPeriods;
            $return["transfer"]["defaultPeriod"] = $transferPeriods[0] ?? -1;
            $return["transfer"]["isFree"] = in_array("0", $transferPeriods);

            $return["addons"]["IDProtection"] = in_array("WHOISTRUSTEE", explode(" ", $response["PROPERTY"]["X-PROXY"][0]));
            $return = Helper::setCache("{$tld}_options", $return);
        }

        return !empty($return) ? $return : $response;
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
}
