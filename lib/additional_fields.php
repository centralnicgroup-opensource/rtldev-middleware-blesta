<?php


/**
 * NOTE: NEVER change the order of the fields; the mapping below depends on it.
 * data to fields for existing entries.
 */

/**
 * CnrAdditionalFields class
 *
 */
class CnrAdditionalFields
{
    /**
     * translation key prefix
     */
    private $transpfx = "Cnr.";
    /**
     * Module input params
     */
    private $params;
    /**
     * container to keep client related data like .DK Hostmaster ID or VAT ID
     */
    private $clientData = [];

    /**
     * Flag to toggle output of translation keys
     */
    private $showTranslationKeys = false;
    /**
     * Method to initiate the class
     *
     * Initiates the additional domain fields configuration
     */
    public function __construct($params)
    {
        $this->params = $params;
        // $this->loadClientDefaults();
        $this->showTranslationKeys = (int)($_GET["showTranslationKeys"] ?? "0");
    }


    /**
     * Get Translation for given Option Value. Fallback to default otherwise.
     * Returns the translation key if requested via GET Parameter
     * @param string $parameter the CNR API parameter name e.g. X-IT-ENTITY-TYPE
     * @param string $value the option value e.g. 1 (Italian and foreign natural persons)
     * @param string $default the fallback for the translation (API Default)
     * @param bool $isrequired to add *optional if useful. true by default to not add it (dropdown options)
     * @param bool $replaceComma to get comma replaced by "⸴" (option labels as comma means start with new option)
     * @return string
     */
    private function getTranslation($parameter, $value, $default, $isrequired = true, $replaceComma = false)
    {
        $key = $this->getTranslationKey($parameter, $value);
        // required
        if ($isrequired) {
            if ($this->showTranslationKeys) {
                return $key;
            }
            $translation = Language::_($key, true);
            $msg = $default;
            if (!empty($translation) && $translation !== $key) { // translation exists
                $msg = $translation;
            }
            return ($replaceComma ? str_replace(",", "⸴", $msg) : $msg);
        }
        $translation = Language::_($key, true);
        $msg = $default;
        if (!empty($translation)) {
            $msg = $translation;
        }
        $msg .= " ";
        return ($replaceComma ? str_replace(",", "⸴", $msg) : $msg);
    }


    /**
     * Get the Translation Key for given Parameter
     * @param string $parameter the CNR API parameter name e.g. X-IT-ENTITY-TYPE
     * @param string|null $value the option value e.g. 1 (Italian and foreign natural persons)
     * @return string
     */
    private function getTranslationKey($parameter, $value = null)
    {
        // e.g. " Cnr.xitpin"
        $basekey = $this->transpfx . strtolower(str_replace("-", "", $parameter));
        if (is_null($value)) {
            return $basekey;
        }
        return $basekey . strtolower(str_replace(" ", "", $value));
    }

    private function getDropdownOptions($name, $values, $labels, $required)
    {
        $options = [];
        foreach ($values as $idx => $val) {
            if (!(bool)preg_match("/^<[A-Z]+>$/", $val)) {
                // if ($name === "X-EU-REGISTRANT-LANG") {
                //     $options[$val] = $val . "|" . Language::_($val, $labels[$idx], true); // todo, fallback logic to translation file
                // } elseif ($name === "X-EU-REGISTRANT-CITIZENSHIP") {
                //     $options[$val] = $val . "|" . Language::_($val, $labels[$idx], true); // todo, fallback logic to translation file
                // } else {
                $options[$val] = $val;
                // Some zones (.ca among them) return more values than labels, so
                // fall back to the raw value rather than an empty label.
                $valTranslation = $this->getTranslation($name, $val, $labels[$idx] ?? $val, true, true);
                if ($val !== $valTranslation) {
                    $options[$val] = $val . "|" . $valTranslation;
                }
                // }
            }
        }
        // TODO: falsy values for fields
        // switch option order for agreement fields for better defaults
        if (!(bool)preg_match("/^X-.+-CONSENTFORPUBLISHING$/i", $name)
            && implode(",", $options) === "0|" . Language::_(" Cnr.0", true) . ",1|" . Language::_(" Cnr.1", true)
        ) {
            $options = array_reverse($options);
        }

        // add optional to dropdown options
        if ($required === false) {
            $translation = Language::_("Cnr.optional", true);
            if ($translation === "Cnr.optional") {
                $translation = "optional";
            }
            $options[""] = " - " . $translation . " -";
        } elseif (is_array($required)) {
            array_unshift($options, " " . $this->getTranslation("conditionalrequirement", null, "- Dynamic Required (see Description) -"));
        }

        // Ensure options are sorted alphabetically, keeping the empty string key at the top
        uksort($options, function ($a, $b) {
            if ($a === "") {
                return -1;
            }
            if ($b === "") {
                return 1;
            }
            return strcasecmp($a, $b);
        });
        return $options;
    }

    /**
     * Identify whether a field is required, optional, or conditionally required.
     * @param string $dependencyVal value of the DEPENDENCY property returned by the API
     * @param string $requiredVal value of the REQUIRED property returned by the API
     * @param array $valuesCache mapping of fields and their supported values
     * @return mixed boolean true/false or array for conditional requirements
     */
    private function getRequirement($dependencyVal, $requiredVal, $valuesCache)
    {
        // Return optional fields in case of activated trustee as required!
        // moved this to the top - $requiredVal is empty for .sk
        $basicregex = preg_quote('[["-eq",["$X-') . ".*" . preg_quote('-ACCEPT-TRUSTEE-TAC",0]]]');
        if ((bool)preg_match("/^" . $basicregex . "$/i", $dependencyVal) ||
            (bool)preg_match("/^" . preg_quote('["-and",') . $basicregex . preg_quote(']') . "$/i", $dependencyVal)
        ) {
            return true;
        }

        // ----------------------------------------------------------------
        // Firstly, check if requiredVal is 0 or empty string which
        // is giving a hint regarding if the field might be required
        // in case dependencyVal (if there's such one) is fulfilled.
        // So, if requiredVal is not 1, we can safely return false already.
        // ----------------------------------------------------------------
        if (empty($requiredVal)) {
            return false;
        }
        // Secondly, if dependencyVal is integer or empty, we ensure to return
        // the boolean value of requiredVal. We wouldn't be able to json_decode
        // dependencyVal safely otherwise.
        if ((bool)preg_match("/^(0|1)?$/", $dependencyVal)) {
            return (bool)(int)$requiredVal;
        }
        // ----------------------------------------------------------------
        // What is left is a dependency expression: the field is required only
        // when other fields hold particular values. It is returned as a map of
        // field name => values that make this field required, and the caller
        // decides how to present that. An expression this method cannot express
        // as such a map returns an empty array, which the caller reads as
        // "required" - over-asking for a registry mandated field is recoverable,
        // omitting one gets the registration rejected.
        // ----------------------------------------------------------------
        $json = json_decode($dependencyVal, true);
        if (is_null($json)) {
            return false;
        }

        // Shape the expression as a map of field name => values that make this
        // field required, for example:
        // 'Required' => [
        //    'Legal Type' => [
        //        'UK Limited Company',
        //        'UK Public Limited Company',
        //     ],
        //     'Other Field' => [
        //         'Other Val 1',
        //         'Other Val 2'
        //     ]
        // ]
        // required in case of legal type matches either value one or value two
        // OR
        // other field matching one of the provided values

        $start = 0;
        $required = [];

        while (!empty($tmp = array_slice($json, $start, 2))) {
            list($operation, $fields) = $tmp;
            // Only "-or" can be represented by a flat value map. "-and" e.g.
            // required if A == "val1" and B == "val2" mapped to or:
            // required if !(A != "val1" or B != "val2")
            if ($operation !== "-or") {
                return [];
            }

            $start += 2;
            foreach ($fields as $condition) {
                list($fieldoperation, $field) = $condition;
                // ensure we rely on -ne or -eq
                if (!(bool)preg_match("/^-(ne|eq)$/", $fieldoperation)) {
                    return [];
                }
                list($parameter, $value) = $field;
                $parameter = substr($parameter, 1); // remove leading $ char

                // local presence service is not offered through this module
                // /TRUSTEE-TAC$/i
                // contact data validation can't be covered via additional fields
                // /^\$(owner|admin|tech|billing)contact\./i
                if (!isset($valuesCache[$parameter])) {
                    continue;
                }

                if (!isset($required[$parameter])) {
                    $required[$parameter] = [];
                }
                // -eq case
                if ($fieldoperation === "-eq") {
                    if (!in_array($value, $required[$parameter])) {
                        $required[$parameter][] = $value;
                    }
                    continue;
                }
                // -ne case
                foreach ($valuesCache[$parameter] as $supportedVal) {
                    if (($supportedVal !== $value)
                        && !in_array($supportedVal, $required[$parameter])
                    ) {
                        $required[$parameter][] = $supportedVal;
                    }
                }
            }
        }

        return (empty($required) ? false : $required);
    }

    /**
     * Method to return list of additional fields for the given parameter data
     *
     * Keeps generated configuration as TransientData. This will improve performance when fields can be requested from API.
     * @return array
     */
    public function getConfiguration($doPrefill = false)
    {
        $domainManager = new CnrDomainManager();

        // Check if the configuration is cached
        $cacheKey = "{$this->params['tld']}_command_syntax_{$this->params['type']}";
        $cfg = CnrHelper::hasCache($cacheKey);
        $cfg = json_decode(json_encode($cfg), true); // convert object to array
        if (!$cfg) {
            // fetch configuration from API
            $cfg = $domainManager->getAdditionalFields($this->params);

            // Only a usable answer is worth keeping. Caching a failed lookup
            // would leave every later order for this TLD without its registry
            // specific fields until the entry expired, and those orders would
            // be rejected only after the customer had paid.
            if (is_array($cfg["PROPERTY"]["PARAMGROUP"] ?? null)) {
                CnrHelper::setCache($cacheKey, $cfg);
            }
        }

        // TODO: column "VALIDATION" maybe used on shopping cart validation hook
        $data = $cfg["PROPERTY"] ?? [];

        // A TLD the registry does not know returns no parameter list. That
        // happens whenever the form is redrawn after a rejected domain, so it
        // has to produce an empty field set rather than a fatal.
        if (!is_array($data["PARAMGROUP"] ?? null)) {
            return [];
        }

        $fields = preg_grep("/^Zone specific|Special parameters$/i", $data["PARAMGROUP"]);

        // build up values cache (used for -ne comparision)
        $valuesCache = [];
        foreach ($fields as $idx => $val) {
            $data["PARAMETER"][$idx] = strtoupper($data["PARAMETER"][$idx]);
            $values = explode("|", $data["RANGE"][$idx]);
            $valuesCache[$data["PARAMETER"][$idx]] = $values;
        }

        // generate fields
        $rows = [];
        foreach ($fields as $idx => $val) {
            $name = $data["PARAMETER"][$idx];
            if (!(bool)preg_match("/^X-/", $name)) {
                continue;
            }
            // filter out values like <TEXT>, <NULL>, <COUNTRY>, ...
            $labels = explode("|", $data["DESCRIPTION"][$idx]);
            $values = $valuesCache[$name];
            $isDropdown = !empty(preg_grep("/^<[A-Z]+>$/", $values, PREG_GREP_INVERT));

            $langVar = $this->getTranslationKey($name);
            $required = $this->getRequirement(
                $data["DEPENDENCY"][$idx],
                $data["REQUIRED"][$idx],
                $valuesCache
            );
            $labelRequired = $required;
            $labelRequired = (
                (is_bool($required) && $required === true) // returned as required
                || (is_array($required) && empty($required)) // empty array
            );

            #echo $name . " => " . \var_export($labelRequired, true) . "<br/>";
            // optional
            if ($this->showTranslationKeys) {
                return $langVar . " *Cnr.optional";
            }

            $opt = "*optional";
            $translation = Language::_("Cnr.optional", true);
            if (!empty($translation) && $translation !== $langVar) { // translation exists
                $opt = "*$translation";
            }
            $displayName = $langVar;
            if (!$this->showTranslationKeys) {
                $displayName = $data["TITLE"][$idx];
                $translation = Language::_($langVar, true);
                if (!empty($translation) && $translation !== $langVar) {
                    $displayName = $translation;
                }
            }
            $row = [
                "name" => $name,
                "label" => $displayName . ($labelRequired ? "" : " " . $opt),
                "type" => $isDropdown ? "select" : "text",
                "description" => $this->getTranslation($name, "descr", array_pop($labels), $labelRequired)
            ];

            if ($required) {
                $row["attributes"] = ["required" => "true"];
            }

            if ($isDropdown) {
                $row["options"] = $this->getDropdownOptions($name, $values, $labels, $labelRequired);
                $row["selected_value"] = reset($row["options"]);
            }

            $rows[$name] = $row;
        }

        // // Prefill fields with Customer Data
        // if ($doPrefill) {
        //     $rows = $this->prefill($rows);
        // }

        // ----------------------------------------------------
        // Custom Extensions / Workarounds / Rewrites of fields
        // ----------------------------------------------------
        foreach ($rows as &$row) {
            if ($this->params["tld"] === "de") {
                // WORKAROUND for RSRMID-1134
                // could be reviewed by command parameter newformat=1
                // that provides bulk parameters as X-DE-NSENTRY# with additional parameter max=#
                // ADDED BY: kschwarz 10.07.2023
                if ((bool)preg_match("/^X-DE-NSENTRY([0-9]+)$/i", $row["name"], $m)) {
                    $row["label"] = preg_replace('/(' . preg_quote($opt, '/') . ')/', " #" . ((int)$m[1] + 1) . ' $1', $row["label"]);
                }
                // WORKAROUND -- END
            }
        }

        // just for debugging
        // $tmp = [];
        // foreach ($fields as $idx => $val) {
        //      $row = [];
        //      foreach (array_keys($data) as $key) {
        //          if (isset($data[$key][$idx])) {
        //              $row[$key] = $data[$key][$idx];
        //          }
        //      }
        //      $tmp[] = $row;
        // }

        return $rows;
    }

    public static function addToCommand(&$params, &$command, $type = "register")
    {
        // .IT: entity type natural person -> cleanup company name
        if ($params["tld"] === "it"
            && $params["X-IT-ENTITY-TYPE"] === "1"
        ) {
            $params["companyname"] = "";
        }

        // RegisterDomain
        if ($type === "register") {
            // ensure that we only add non-empty parameters
            foreach ($params["additionalfields"] as $param => $val) {
                if ($val !== "") {
                    $command[$param] = $val;
                }
            }
            return;
        }
        // TransferDomain
        if (in_array($type, ["transfer", "trade", "modify"])) {
            // get the fields provided by the caller
            $registerFields = $params["additionalfields"];

            // fetch transfer fields
            $fields = new self(array_merge($params, [
                "type" => $type,
                "fields" => [] // no caller supplied fields
            ]));

            // loop over transfer fields and grep values from the caller's fields
            $transferfields = $fields->getConfiguration(false); // skip prefill
            foreach ($transferfields as $field) {
                $name = $field["Name"];
                if (isset($registerFields[$name])) {
                    // add as api command parameter
                    $command[$name] = $registerFields[$name]; // can be empty for fields cleanup
                }
            }
            return;
        }
    }
}
