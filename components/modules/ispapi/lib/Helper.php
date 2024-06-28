<?php

namespace HEXONET\MODULE\LIB;

use HEXONET\MODULE\LIB\Base;

define("CNIC_TLD_CACHE", "1 day");

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
        // Check if response indicates an error
        if (isset($response['CODE']) && $response['CODE'] !== "200") {
            // Handle non-successful responses
            if (isset($response['error'])) {
                Base::moduleInstance()->Input->setErrors([
                    "errors" => [$response['error']],
                ]);
            } else {
                Base::moduleInstance()->Input->setErrors([
                    "errors" => ["Oops something went wrong!"],
                ]);
            }
            return false;
        }

        // No explicit error, assume successful response
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
    public static function getRowRules(&$vars, $module_row_id = null)
    {
        $instance = Base::moduleInstance();
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
                        isset($vars["dnssec"]) ? $vars["dnssec"] : "false",
                        $module_row_id
                    ],
                    "message" => \Language::_("Ispapi.!error.key.valid_connection", true),
                ],
            ],
        ];
    }

    /**
     * retrieve data from cache if available.
     *
     * @param string $keyName The key name for the cache.
     * @return mixed|false The cached data or false if caching is disabled or an error occurs.
     */
    public static function hasCache(string $keyName)
    {
        // If cache is disabled or key name is empty, return false
        if (!\Configure::get("Caching.on") || empty($keyName)) {
            return false;
        }

        // Fetch the data from cache if available
        $cache = \Cache::fetchCache(
            $keyName,
            \Configure::get("Blesta.company_id") . \DS . "modules" . \DS . "ispapi" . \DS
        );

        // If cache exists, return the cached data
        if ($cache) {
            return json_decode($cache);
        }

        return false;
    }

    /**
     * Set cache data in the system.
     *
     * @param string $keyName The key name for the cache.
     * @param object|array $cacheData The data to store in cache.
     * @return bool True if the data was successfully cached, false otherwise.
     */
    public static function setCache(string $keyName, object|array $cacheData)
    {
        // If caching is disabled, key name is empty, or cache data is empty, return false
        if (!\Configure::get("Caching.on") || empty($keyName) || empty($cacheData)) {
            return false;
        }

        try {
            // Write data to cache
            \Cache::writeCache(
                $keyName,
                json_encode($cacheData),
                strtotime(CNIC_TLD_CACHE) - time(),
                \Configure::get("Blesta.company_id") . \DS . "modules" . \DS . "ispapi" . \DS
            );
        } catch (\Exception $e) {
            // Write to cache failed, so disable caching
            \Configure::set("Caching.on", false);
            return false;
        }

        return self::hasCache($keyName);
    }

    /**
     * Helper function to parse period data.
     *
     * @param array|string $periods Periods data from API response.
     * @return array Parsed periods.
     */
    public static function parsePeriods($periods)
    {
        if (empty($periods)) {
            return [];
        }

        // Filter and format periods array
        return preg_replace("/(^R|Y$)/", "", preg_grep("/^R?(\d+)Y$/", explode(",", $periods)));
    }
}
