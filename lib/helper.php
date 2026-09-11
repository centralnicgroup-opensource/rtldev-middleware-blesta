<?php

declare(strict_types=1);

use CNIC\IDNA\Factory\ConverterFactory;

if (!defined("CNIC_TLD_CACHE")) {
    define("CNIC_TLD_CACHE", "1 day");
}

final class CnrHelper
{
    /**
     * Retrieves the resource record for a given domain.
     *
     * @param array<string, mixed> $record resource record with their respective data.
     * @param string $domain The domain name for which to retrieve the resource record. Default is an empty string.
     * @param int $defaultTtl TTL to use when the record carries none of its own.
     * @return string|array<array-key, mixed> A single zone line as a string, or the record array for the
     *  forwarding and MXE cases, which expand to more than one line.
     */
    public static function getResourceRecord(
        array $record,
        string $domain = "",
        int $defaultTtl = CnrModuleSettings::DEFAULT_TTL
    ): string|array {
        // Determine record to add
        $zone = [];
        $ttl = $record["ttl"] ?? $defaultTtl;
        if (!is_numeric($ttl) || (int) $ttl <= 0) {
            $ttl = $defaultTtl;
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
     * @param array<string, mixed>|\stdClass|null $response The response to be evaluated. Expected to be an associative array or an object with a 'CODE' key and optionally an 'error' key.
     * @param string $successCodes A regex pattern representing the success codes. Defaults to "/^200$/".
     * @return boolean
     */
    public static function errorHandler(array|\stdClass|null $response, string $successCodes = "/^200$/"): bool
    {
        if ($response instanceof \stdClass) {
            $response = (array) json_decode((string) json_encode($response), true);
        }

        // Check if response indicates an error
        if (isset($response['CODE']) && !preg_match($successCodes, $response['CODE'])) {
            $module = CnrBase::moduleInstance();
            if ($module !== null) {
                $module->Input->setErrors([
                    "errors" => [
                        $response['error'] ?? Language::_("Cnr.!error.unexpected", true),
                    ],
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
     * @param array<string, array<int, mixed>> $resourceRecords
     * @param string $domain
     * @return array<int, array<string, mixed>> the formatted records
     */
    public static function getResourceRecords(
        array $resourceRecords,
        string $domain = "",
        int $defaultTtl = CnrModuleSettings::DEFAULT_TTL
    ): array {
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
            $hostrecords[$i]["raw_record"] = self::getResourceRecord($hostrecords[$i], $domain, $defaultTtl);
        }
        return $hostrecords;
    }

    /**
     * Retrieves the supported Resource Record (RR) types.
     *
     * This method returns an array of supported DNS Resource Record types.
     *
     * @return array<int, string> An array of supported RR types.
     */
    public static function getSupportedRRTypes(): array
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
     * @param array<string, mixed> $vars An array of key/value data pairs
     * @param int|null $module_row_id The module row ID to validate against
     * @return array<string, mixed> An array of Input rules suitable for Input::setRules()
     */
    public static function getRowRules(array &$vars, ?int $module_row_id = null): array
    {
        $instance = CnrBase::moduleInstance();
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
            // The three below are optional; they only have to be sane when set.
            "proxy_server" => [
                "valid" => [
                    "if_set" => true,
                    "rule" => ["matches", "#^$|^(https?|socks5)://[^\s]+$#i"],
                    "message" => \Language::_("Cnr.!error.proxy_server.valid", true),
                ],
            ],
            "dns_nameservers" => [
                "valid" => [
                    "if_set" => true,
                    "rule" => [[self::class, "validateNameserverList"]],
                    "message" => \Language::_("Cnr.!error.dns_nameservers.valid", true),
                ],
            ],
            "default_ttl" => [
                "valid" => [
                    "if_set" => true,
                    "rule" => ["matches", "#^$|^[1-9][0-9]{0,6}$#"],
                    "message" => \Language::_("Cnr.!error.default_ttl.valid", true),
                ],
            ],
        ];
    }

    /**
     * Whether the value is a syntactically valid host name.
     *
     * Unicode labels are accepted alongside their punycode form, because a
     * customer may type either and the conversion happens later. That is also
     * why the last label cannot be restricted to letters: every IDN top level
     * domain reaches us as "xn--" followed by digits and hyphens. It does have
     * to begin with a letter, which is what keeps a bare IP address out.
     */
    public static function isHostName(?string $value): bool
    {
        $value = trim((string) $value);

        return $value !== "" && preg_match(
            '/^(?=.{1,253}\z)([\p{L}\p{N}]([\p{L}\p{N}-]{0,61}[\p{L}\p{N}])?\.)+'
                . '\p{L}[\p{L}\p{N}-]{0,61}[\p{L}\p{N}]\z/u',
            $value
        ) === 1;
    }

    /**
     * Every entry of a comma separated nameserver list has to look like a host.
     *
     * An empty value is accepted: the managed DNS defaults apply then.
     */
    public static function validateNameserverList(?string $value): bool
    {
        $value = trim((string) $value);
        if ($value === "") {
            return true;
        }

        foreach (explode(",", $value) as $host) {
            if (!self::isHostName($host)) {
                return false;
            }
        }

        return true;
    }

    /**
     * retrieve data from cache if available.
     *
     * @param string $keyName The key name for the cache.
     * @param bool $returnAsArray Whether to return the cached data as an array.
     * @return mixed|false The cached data or false if caching is disabled or an error occurs.
     */
    public static function hasCache(string $keyName, bool $returnAsArray = false): mixed
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
     * @param object|array<string, mixed> $cacheData The data to store in cache.
     * @param int|null $ttl The time-to-live for the cache data. Default is null.
     * @return bool True if the data was successfully cached, false otherwise.
     */
    public static function setCache(string $keyName, object|array $cacheData, ?int $ttl = null): bool
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
                (string) json_encode($cacheData),
                $ttl,
                \Configure::get("Blesta.company_id") . \DS . "modules" . \DS . "cnr" . \DS
            );
        } catch (\Exception $e) {
            // Write to cache failed, so disable caching
            \Configure::set("Caching.on", false);
            return false;
        }

        // Read it back: a write can silently produce nothing (unwritable cache
        // directory, for instance), and callers need to know whether the entry
        // is really there.
        return self::hasCache($keyName) !== false;
    }

    /**
     * Clears the cache for the given key name.
     *
     * @param string $keyName The name of the cache key to clear.
     * @return void
     */
    public static function clearCache(string $keyName): void
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
     * CnrHelper function to parse period data.
     *
     * The registry reports a period column as a comma separated list such as
     * "1Y,2Y,3Y". Three shapes need care:
     *
     *  - "n/a" means the operation is not offered for the zone at all. It has to
     *    yield an empty list, not a zero year term, or callers cannot tell
     *    "no such operation" apart from "a term of zero".
     *  - Some zones report month based periods ("1M", "3M"). Only whole year
     *    terms are usable here, and "3M" must never be read as three years.
     *  - Terms are capped at ten years, which is also the ceiling
     *    RegistrarModule::isValidTerm() enforces, so anything above it could
     *    never be ordered anyway.
     *
     * Reset periods are reported with an "R" prefix ("R1Y") and are read as
     * their plain equivalent.
     *
     * @param array<int, string>|string $periods Periods data from API response.
     * @return array<int, int> Parsed periods, in whole years.
     */
    public static function parsePeriods(array|string $periods): array
    {
        $periods = trim(is_array($periods) ? implode(",", $periods) : $periods);

        if ($periods === "" || strtolower($periods) === "n/a") {
            return [];
        }

        // Drop the "R" of reset periods before matching
        $values = preg_replace("/^R/i", "", array_map("trim", explode(",", $periods)));

        // Whole year terms only, 0Y through 10Y
        $values = preg_grep("/^(?:10|[0-9])Y$/i", $values);

        return $values
            ? array_values(array_unique(array_map("intval", $values)))
            : [];
    }

    /**
     * Convert domain names to idn + punycode if necessary
     * @param array<int, string> $data list of domain names (or tlds)
     * @return array<int, array{idn: string|false, punycode: string|false}>
     */
    public static function IDNConvert(array $data): array
    {
        return ConverterFactory::convert($data);
    }

    /**
     * Gets proper expiration date property from API as unix timestamp
     * @param string|null $renewalDate
     * @param string|null $paidUntilDate
     * @param string|null $expirationDate
     * @return int
     */
    public static function getExpiryDate(?string $renewalDate, ?string $paidUntilDate, ?string $expirationDate): int
    {
        // Every source may be absent; castDate() yields a zero timestamp then.
        $expirationTS = self::castDate($paidUntilDate ?? $expirationDate ?? "");
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
     * @return array{ts: int, short: string, long: string}
     */
    public static function castDate(string $date): array
    {
        $utcDate = str_replace(" ", "T", $date) . "Z"; //RFC 3339 / ISO 8601
        // strtotime() reports failure as false; callers compare and format this,
        // so an unparsable value becomes 0 rather than leaking a boolean.
        $ts = (int) strtotime($utcDate);
        return [
            "ts" => $ts,
            "short" => date("Y-m-d", $ts),
            "long" => date("Y-m-d H:i:s", $ts)
        ];
    }

    /**
     * Extracts the SLD (Second Level Domain) and TLD (Top Level Domain) from a given domain.
     *
     * @param string $domain The domain name to extract SLD and TLD from.
     * @param bool $tldOnly Return just the TLD instead of both parts.
     * @return string|array{sld: string, tld: string} The TLD, or both parts.
     */
    public static function getSldTld(string $domain, bool $tldOnly = false): string|array
    {
        list($sld, $tld) = explode(".", $domain, 2);

        if ($tldOnly) {
            return $tld;
        }

        return [
            "sld" => $sld,
            "tld" => $tld
        ];
    }
}
