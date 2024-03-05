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

    public function create($params, $dnszone)
    {
        // $ispapi_module = new ();
        $r = Ispapi::_call([
            "COMMAND" => "CreateDNSZone",
            "DNSZONE" => $dnszone,
            "EXTERNAL" => 0
        ], $params);
        if ($r["CODE"] !== "200") {
            return [
                "success" => false,
                "error" => "Creating non-hidden DNSZone failed. (" . $r["CODE"] . " " . $r["DESCRIPTION"] . ")",
                "errorcode" => $r["CODE"]
            ];
        }
        return [
            "success" => true,
            "data" => $r["PROPERTY"]
        ];
    }

    public function getDNSZoneRRList($domain)
    {
        // Example usage of call method
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
        return $this->call([
            "COMMAND" => "QueryDomainOptions",
            "DOMAIN0" => $domain
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
}
