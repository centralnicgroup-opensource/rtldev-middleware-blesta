<?php

namespace HEXONET\MODULE\LIB;

use HEXONET\MODULE\LIB\Base;

class Helper
{
    public static function getResourceRecord($data)
    {
        // hostname ttl IN record_type priority address
        $record = $data['hostname'] . " " . $data['ttl'] . " IN " . $data['record_type'];
        if (isset($data['priority']) && !empty($data['priority']) && ($data['record_type'] == 'MX' || $data['record_type'] == 'SRV')) {
            $record .= " " . $data['priority'];
        }
        $record .= " " . $data['address'];
        return $record;
    }

    public static function errorHandler($response)
    {
        if ($response["CODE"] !== "200") {
            if (isset($response["error"])) {
                Base::getIspapiInstance()->Input->setErrors([
                    "errors" => [$response["error"]],
                ]);
            } else {
                Base::getIspapiInstance()->Input->setErrors([
                    "errors" => ["Oops something went wrong!"],
                ]);
            }
            return false;
        }
        return true;
    }

    public static function getResourceRecords($resourceRecords)
    {
        $hostrecords = [];
        foreach ($resourceRecords as $rr_id => $rr) {
            $fields = explode(" ", $rr);
            $domain = array_shift($fields);
            $ttl = array_shift($fields);
            $class = array_shift($fields);
            $rrtype = array_shift($fields);

            if (!(bool)preg_match("/^(" . implode("|", self::getSupportedRRTypes()) . ")$/", $rrtype)) {
                continue;
            }

            if ((bool)preg_match("/^(A|AAAA|CNAME)$/", $rrtype)) {
                if (
                    $rrtype !== "A" ||
                    !preg_match("/^mxe-host-for-ip-(\d+)-(\d+)-(\d+)-(\d+)$/i", $domain, $m)
                ) {
                    $hostrecords[$rr_id] = [
                        "hostname" => $domain,
                        "ttl" => $ttl,
                        "record_type" => $rrtype,
                        "address" => $fields[0],
                    ];
                    $hostrecords[$rr_id]["raw_record"] = Helper::getResourceRecord($hostrecords[$rr_id]);
                    continue;
                }
            }

            if ($rrtype === "SRV" || $rrtype === "MX") {
                $priority = array_shift($fields);
                $hostrecords[$rr_id] = [
                    "hostname" => $domain,
                    "ttl" => $ttl,
                    "record_type" => $rrtype,
                    "address" => implode(" ", $fields),
                    "priority" => $priority
                ];
                $hostrecords[$rr_id]["raw_record"] = Helper::getResourceRecord($hostrecords[$rr_id]);
                continue;
            }

            if ($rrtype === "X-HTTP") {
                if (preg_match("/^\//", $fields[0])) {
                    $domain .= array_shift($fields);
                }

                $url_type = array_shift($fields);
                if ($url_type === "REDIRECT") {
                    $url_type = "URL";
                }

                $hostrecords[$rr_id] = [
                    "hostname" => $domain,
                    "ttl" => $ttl,
                    "record_type" => $url_type,
                    "address" => implode(" ", $fields)
                ];
                $hostrecords[$rr_id]["raw_record"] = Helper::getResourceRecord($hostrecords[$rr_id]);
                continue;
            }

            // TXT or other records
            $hostrecords[$rr_id] = [
                "hostname" => $domain,
                "ttl" => $ttl,
                "record_type" => $rrtype,
                "address" => implode(" ", $fields)
            ];
            $hostrecords[$rr_id]["raw_record"] = Helper::getResourceRecord($hostrecords[$rr_id]);
        }
        return $hostrecords;
    }

    public static function getSupportedRRTypes()
    {
        return [
            "A", "AAAA", "ALIAS", "CAA", "CNAME", "MX", "MXE",
            "NAPTR", "NS", "PTR", "SPF", "SSHFP", "SRV", "TXT",
            "TLSA", "X-HTTP"
        ];
    }

        /**
     * Builds and returns the rules required to add/edit a module row
     *
     * @param array $vars An array of key/value data pairs
     * @return array An array of Input rules suitable for Input::setRules()
     */
    public static function getRowRules(&$vars)
    {
        $instance = Base::getIspapiInstance();
        return [
            "user" => [
                "valid" => [
                    "rule" => "isEmpty",
                    "negate" => true,
                    "message" => \Language::_("Ispapi.!error.user.valid", true),
                ],
            ],
            "key" => [
                "valid" => [
                    "last" => true,
                    "rule" => "isEmpty",
                    "negate" => true,
                    "message" => \Language::_("Ispapi.!error.key.valid", true),
                ],
                "valid_connection" => [
                    "rule" => [
                        [$instance, "validateConnection"],
                        $vars["user"],
                        isset($vars["sandbox"]) ? $vars["sandbox"] : "false",
                    ],
                    "message" => \Language::_("Ispapi.!error.key.valid_connection", true),
                ],
            ],
        ];
    }
}
