<?php

namespace CNR\MODULE\LIB;

use CNR\MODULE\LIB\Base;
use CNIC\IDNA\Factory\ConverterFactory;

if (!defined("CNIC_TLD_CACHE")) {
    define("CNIC_TLD_CACHE", "1 day");
}

class Helper
{
    /**
     * Retrieves the resource record for a given domain.
     *
     * @param array $record resource record with their respective data.
     * @param string $domain The domain name for which to retrieve the resource record. Default is an empty string.
     * @return mixed The resource record data for the specified domain and record type.
     */
    public static function getResourceRecord(array $record, string $domain = "")
    {
        // Determine record to add
        $zone = [];
        $ttl = $record["ttl"] ?? "3600";
        if (!is_numeric($ttl)) {
            $ttl = "3600";
        }

        if (!$record['hostname'] || (!empty($domain) && $record['hostname'] === $domain)) {
            $record['hostname'] = "@";
        }

        switch ($record['record_type']) {
            case "URL":
            case "FRAME":
                $record["hostname"] = ($record["hostname"] == "@") ? $domain : $record["hostname"] . "." . $domain;
                $record["record_type"] = $record["record_type"] == "URL" ? "RD" : "MRD";
                $zone[] = $record;
                break;
            case "MXE":
                $address = $record["address"];
                $mxpref = is_numeric($record["priority"]) ? $record["priority"] : "100";
                if (preg_match("/^([0-9]+) (.*)$/", $record["address"], $m)) {
                    $mxpref = $m[1];
                    $address = $m[2];
                }
                if (preg_match("/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/", $address, $m)) {
                    $mxe_host = "mxe-host-for-ip-$m[1]-$m[2]-$m[3]-$m[4]";
                    $ip = $m[1] . "." . $m[2] . "." . $m[3] . "." . $m[4];
                    $zone[] = sprintf("%s %s IN MX %s %s", $record['hostname'], $ttl, $mxpref, $mxe_host);
                    $zone[] = sprintf("%s IN A %s", $mxe_host, $ip);
                } else {
                    $zone[] = sprintf("%s %s IN MX %s %s", $record['hostname'], $ttl, $mxpref, $address);
                }
                break;
            case "MX":
            case "SRV":
                $zone[] = sprintf("%s %s IN %s %s %s", $record['hostname'], $ttl, $record['record_type'], $record['priority'], $record['address']);
                break;
            case "NS":
                $zone[] = sprintf("%s %s %s %s", $record['hostname'], $ttl, $record['record_type'], $record['address']);
                break;
            default:
                $zone[] = sprintf("%s %s IN %s %s", $record['hostname'], $ttl, $record['record_type'], $record['address']);
        }
        if (count($zone) <= 1) {
            return $zone[0];
        }
        return $zone;
    }

    /**
     * Handles errors based on the response and success codes.
     *
     * @param array|\stdClass|null $response The response to be evaluated. Expected to be an associative array or an object with a 'CODE' key and optionally an 'error' key.
     * @param string $successCodes A regex pattern representing the success codes. Defaults to "/^200$/".
     * @return boolean
     */
    public static function errorHandler(array|\stdClass|null $response, string $successCodes = "/^200$/")
    {
        if ($response instanceof \stdClass) {
            $response = json_decode(json_encode($response), true);
        }

        // Check if response indicates an error
        if (isset($response['CODE']) && !preg_match($successCodes, $response['CODE'])) {
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

    /**
     * get formatted resource records
     *
     * @param array $resourceRecords
     * @param string $domain
     * @return array
     */
    public static function getResourceRecords(array $resourceRecords, string $domain = "")
    {
        if (empty($resourceRecords)) {
            return [];
        }
        $hostrecords = [];
        for ($i = 0; $i < $resourceRecords['COUNT'][0]; $i++) {
            $name = $resourceRecords['NAME'][$i];
            $rrtype = $resourceRecords['TYPE'][$i];
            $content = $resourceRecords['CONTENT'][$i];
            $priority = $resourceRecords['PRIO'][$i];
            $ttl = $resourceRecords['TTL'][$i];

            if ($rrtype == 'MX') {
                if ($content == $priority) {
                    continue;
                }
                if (substr($content, 0, strlen($priority)) === $priority) {
                    $content = substr($content, strlen($priority) + 1);
                }
            }

            if (!(bool)preg_match("/^(" . implode("|", self::getSupportedRRTypes()) . ")$/", $rrtype)) {
                continue;
            }

            if ($resourceRecords['LOCKED'][$i] == 1) {
                $fwdtype = "URL";
                if (strtolower($rrtype) == "mrd") {
                    $fwdtype = "FRAME";
                }
                $hostrecords[$i] = [
                    'hostname' => $name,
                    'record_type' => $fwdtype,
                    'address' => $content
                ];
                $hostrecords[$i]["raw_record"] = $fwdtype;
                continue;
            }

            if ($rrtype == 'MX') {
                if ($content == $priority) {
                    continue;
                }
                if (substr($content, 0, strlen($priority)) === $priority) {
                    $content = substr($content, strlen($priority) + 1);
                }
            }


            // TXT or other records
            $hostrecords[$i] = [
                "hostname" => $name,
                "ttl" => $ttl,
                "record_type" => $rrtype,
                "address" => $content
            ];
            $hostrecords[$i]["raw_record"] = Helper::getResourceRecord($hostrecords[$i], $domain);
        }
        return $hostrecords;
    }

    /**
     * Retrieves the supported Resource Record (RR) types.
     *
     * This method returns an array of supported DNS Resource Record types.
     *
     * @return array An array of supported RR types.
     */
    public static function getSupportedRRTypes()
    {
        return [
            "A",
            "AAAA",
            "ALIAS",
            "CAA",
            "CNAME",
            "MX",
            "MXE",
            "NAPTR",
            "NS",
            "PTR",
            "SPF",
            "SSHFP",
            "SRV",
            "TXT",
            "TLSA",
            "URL",
            "FRAME"
        ];
    }

    /**
     * Builds and returns the rules required to add/edit a module row
     *
     * @param array $vars An array of key/value data pairs
     * @param int|null $module_row_id The module row ID to validate against
     * @return array An array of Input rules suitable for Input::setRules()
     */
    public static function getRowRules(array &$vars, $module_row_id = null)
    {
        $instance = Base::moduleInstance();
        return [
            "user" => [
                "valid" => [
                    "rule" => "isEmpty",
                    "negate" => true,
                    "message" => \Language::_("Cnr.!error.user.valid", true),
                ],
            ],
            "key" => [
                "valid" => [
                    "last" => true,
                    "rule" => "isEmpty",
                    "negate" => true,
                    "message" => \Language::_("Cnr.!error.key.valid", true),
                ],
                "valid_connection" => [
                    "rule" => [
                        [$instance, "validateConnection"],
                        $vars["user"],
                        isset($vars["sandbox"]) ? $vars["sandbox"] : "false",
                        isset($vars["dnssec"]) ? $vars["dnssec"] : "false",
                        $module_row_id
                    ],
                    "message" => \Language::_("Cnr.!error.key.valid_connection", true),
                ],
            ],
        ];
    }

    /**
     * retrieve data from cache if available.
     *
     * @param string $keyName The key name for the cache.
     * @param bool $returnAsArray Whether to return the cached data as an array.
     * @return mixed|false The cached data or false if caching is disabled or an error occurs.
     */
    public static function hasCache(string $keyName, bool $returnAsArray = false)
    {
        // If cache is disabled or key name is empty, return false
        if (!\Configure::get("Caching.on") || empty($keyName)) {
            return false;
        }

        // Fetch the data from cache if available
        $cache = \Cache::fetchCache(
            $keyName,
            \Configure::get("Blesta.company_id") . \DS . "modules" . \DS . "cnr" . \DS
        );

        // If cache exists, return the cached data
        if ($cache) {
            return $returnAsArray ? json_decode($cache, true) : json_decode($cache);
        }

        return false;
    }

    /**
     * Set cache data in the system.
     *
     * @param string $keyName The key name for the cache.
     * @param object|array $cacheData The data to store in cache.
     * @param int|null $ttl The time-to-live for the cache data. Default is null.
     * @return bool True if the data was successfully cached, false otherwise.
     */
    public static function setCache(string $keyName, object|array $cacheData, $ttl = null)
    {
        // Calculate TTL if not provided
        if (is_null($ttl)) {
            $ttl = strtotime(CNIC_TLD_CACHE) - time();
        }

        // If caching is disabled, key name is empty, or cache data is empty, return false
        if (!\Configure::get("Caching.on") || empty($keyName) || empty($cacheData)) {
            return false;
        }

        try {
            // Write data to cache
            \Cache::writeCache(
                $keyName,
                json_encode($cacheData),
                $ttl,
                \Configure::get("Blesta.company_id") . \DS . "modules" . \DS . "cnr" . \DS
            );
        } catch (\Exception $e) {
            // Write to cache failed, so disable caching
            \Configure::set("Caching.on", false);
            return false;
        }

        return self::hasCache($keyName);
    }

    /**
     * Clears the cache for the given key name.
     *
     * @param string $keyName The name of the cache key to clear.
     * @return void
     */
    public static function clearCache(string $keyName)
    {
        // If cache is disabled or key name is empty, return false
        if (!\Configure::get("Caching.on") || empty($keyName)) {
            return;
        }

        // Clear the cache
        \Cache::clearCache(
            $keyName,
            \Configure::get("Blesta.company_id") . \DS . "modules" . \DS . "cnr" . \DS
        );
    }

    /**
     * Helper function to parse period data.
     *
     * @param array|string $periods Periods data from API response.
     * @return array Parsed periods.
     */
    public static function parsePeriods(array|string $periods)
    {
        return array_values(array_unique( // unique values, re-indexed
            array_map( // convert strings to ints
                "intval",
                preg_grep( // filter out 1M period, not supported by blesta at all;  and empty string which is probably a no longer supported zone
                    "/^(1M)?$/",
                    preg_replace(
                        "/^R/", // replace "R" of reset periods
                        "",
                        explode(",", $periods)
                    ),
                    PREG_GREP_INVERT
                )
            )
        ));
    }

    /**
     * Convert domain names to idn + punycode if necessary
     * @param array $domains list of domain names (or tlds)
     * @return array
     */
    public static function IDNConvert(array $data)
    {
        return ConverterFactory::convert($data);
    }

    /**
     * Gets proper expiration date property from API as unix timestamp
     * @param string|null $renewalDate
     * @param string|null $paidUntilDate
     * @param string|null $expirationDate
     * @param string $renewalMode
     * @param array $periods
     * @return int
     */
    public static function getExpiryDate(?string $renewalDate, ?string $paidUntilDate, ?string $expirationDate)
    {
        $expirationTS = self::castDate($paidUntilDate ?? $expirationDate);
        if (!is_null($renewalDate)) {
            $renewalTS = self::castDate($renewalDate);
            if ($renewalTS["ts"] < $expirationTS["ts"]) {
                $expirationTS = $renewalTS;
            }
        }

        return (int) $expirationTS["ts"];
    }

    /**
     * Cast our UTC API timestamps to local timestamp string and unix timestamp
     * @param string $date API timestamp (YYYY-MM-DD HH:ii:ss)
     * @return array<string, mixed>
     */
    public static function castDate(string $date)
    {
        $utcDate = str_replace(" ", "T", $date) . "Z"; //RFC 3339 / ISO 8601
        $ts = strtotime($utcDate);
        return [
            "ts" => $ts,
            "short" => date("Y-m-d", $ts === false ? 0 : $ts),
            "long" => date("Y-m-d H:i:s", $ts === false ? 0 : $ts)
        ];
    }

    /**
     * Extracts the SLD (Second Level Domain) and TLD (Top Level Domain) from a given domain.
     *
     * @param string $domain The domain name to extract SLD and TLD from.
     * @return array|string An associative array containing 'sld' and 'tld'.
     */
    public static function getSldTld(string $domain, bool $tldOnly = false)
    {
        list($sld, $tld) = explode(".", $domain, 2);

        if ($tldOnly) {
            return $tld ?? "";
        }

        return [
            "sld" => $sld,
            "tld" => $tld
        ];
    }
}
