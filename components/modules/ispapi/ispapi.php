<?php

use HEXONET\MODULE\LIB\Base;
use HEXONET\MODULE\LIB\DomainManager;
use HEXONET\MODULE\LIB\Helper;

/**
 * Ispapi Module
 *
 * @package blesta
 * @subpackage blesta.components.modules.ispapi
 * @copyright Copyright (c) 2018-2021, HEXONET.
 * @license https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/master/LICENSE MIT
 * @see https://www.hexonet.net/ HEXONET
 */
class Ispapi extends RegistrarModule
{
    /**
     * @var string Default module view path
     */
    private static $defaultModuleView = "components" . DS . "modules" . DS . "ispapi" . DS;

    private $domainManager;

    /**
     * Initializes the module
     */
    public function __construct()
    {
        // Load the language required by this module
        Language::loadLang("ispapi", null, __DIR__ . DS . "language" . DS);
        // Load config.json (important to have language loaded first)
        $this->loadConfig(__DIR__ . DS . "config.json");
        // Load components required by this module
        Loader::loadComponents($this, ["Input", "Record"]);
        // Load configuration
        Configure::load("ispapi", __DIR__ . DS . "config" . DS);

        // ---------------------------------------------------------------
        // HEXONET's PHP-SDK
        // ---------------------------------------------------------------
        $path = implode(DS, [__DIR__, "apis", "vendor", ""]);
        Loader::load($path . "autoload.php");
        $path = implode(DS, [__DIR__, "apis", ""]);
        Loader::load($path . "BlestaLogger.php");
        // ---------------------------------------------------------------

        $this->domainManager = new DomainManager();
    }

    /**
     * Cast our UTC API timestamps to UTC timestamp string and unix timestamp
     * @param string|int $date API timestamp (YYYY-MM-DD HH:ii:ss) or unix timestamp produced by strtotime
     * @return array
     */
    public function _castDate(string $date, string $format): array
    {
        $ts = is_int($date) ?
            $date :
            strtotime(str_replace(" ", "T", $date) . "Z"); //RFC 3339 / ISO 8601
        return [
            "ts" => $ts,
            "short" => gmdate("Y-m-d", $ts),
            "long" => gmdate($format, $ts),
        ];
    }

    /**
     * Attempts to validate service info. This is the top-level error checking method. Sets Input errors on failure.
     *
     * @param stdClass $package A stdClass object representing the selected package
     * @param array $vars An array of user supplied info to satisfy the request
     * @return bool True if the service validates, false otherwise. Sets Input errors when false.
     */
    public function validateService($package, array $vars = null)
    {
        // TODO: the right place to validate authcodes for transfer
        //       and additional domain fields
        return true;
    }

    /**
     * Adds the service to the remote server. Sets Input errors on failure,
     * preventing the service from being added.
     *
     * @param stdClass $package A stdClass object representing the selected package
     * @param array $vars An array of user supplied info to satisfy the request
     * @param stdClass $parent_package A stdClass object representing the parent
     *  service's selected package (if the current service is an addon service)
     * @param stdClass $parent_service A stdClass object representing the parent
     *  service of the service being added (if the current service is an addon
     *  service and parent service has already been provisioned)
     * @param string $status The status of the service being added. These include:
     *  - active
     *  - canceled
     *  - pending
     *  - suspended
     * @return array A numerically indexed array of meta fields to be stored for this service containing:
     *  - key The key for this meta field
     *  - value The value for this key
     *  - encrypted Whether or not this field should be encrypted (default 0, not encrypted)
     * @see Module::getModule()
     * @see Module::getModuleRow()
     */
    public function addService(
        $package,
        array $vars = null,
        $parent_package = null,
        $parent_service = null,
        $status = "pending"
    ) {
        // 'Service' meaning here registered or tranferred domain name
        $whois_sections = Configure::get("Ispapi.whois_sections");

        $tld = null;
        $input_fields = [];

        if (isset($vars["domain"])) {
            $tld = $this->getTld($vars["domain"]);
        }

        $input_fields = array_merge(
            Configure::get("Ispapi.domain_fields"),
            (array) Configure::get("Ispapi.domain_fields" . $tld),
            (array) Configure::get("Ispapi.nameserver_fields"),
            (array) Configure::get("Ispapi.transfer_fields"),
            [
                "NumYears" => true,
                "transfer" => isset($vars["transfer"]) ? $vars["transfer"] : 1,
            ]
        );

        $row = $this->getModuleRow($package->module_row);
        Base::setModule($row);
        Base::moduleInstance($this);

        if (isset($vars["use_module"]) && $vars["use_module"] == "true") {
            if ($package->meta->type === "domain") {
                $vars["NumYears"] = 1;
                $vars["SLD"] = substr($vars["domain"], 0, -strlen($tld));
                $vars["TLD"] = ltrim($tld, ".");

                foreach ($package->pricing as $pricing) {
                    if ($pricing->id === $vars["pricing_id"]) {
                        $vars["NumYears"] = $pricing->term;
                        $vars["Period"] = $pricing->period;
                        break;
                    }
                }

                // Fields for contact information
                $whois_fields = Configure::get("Ispapi.whois_fields");

                // Contact information of a customer
                if (!isset($this->Clients)) {
                    Loader::loadModels($this, ["Clients"]);
                }
                if (!isset($this->Contacts)) {
                    Loader::loadModels($this, ["Contacts"]);
                }

                $client = $this->Clients->get($vars["client_id"]);

                if ($client) {
                    $numbers = $this->Contacts->getNumbers($client->contact_id, "phone");
                }

                // Customer contact information according to whois_fields = Registrant, Admin, Tech and Billing
                foreach ($whois_fields as $key => $value) {
                    if (strpos($key, "FirstName") !== false) {
                        $vars[$key] = $client->first_name;
                    } elseif (strpos($key, "LastName") !== false) {
                        $vars[$key] = $client->last_name;
                    } elseif (strpos($key, "Organization") !== false) {
                        $vars[$key] = $client->company;
                    } elseif (strpos($key, "Address1") !== false) {
                        $vars[$key] = $client->address1;
                    } elseif (strpos($key, "Address2") !== false) {
                        $vars[$key] = $client->address2;
                    } elseif (strpos($key, "City") !== false) {
                        $vars[$key] = $client->city;
                    } elseif (strpos($key, "StateProvince") !== false) {
                        $vars[$key] = $client->state;
                    } elseif (strpos($key, "PostalCode") !== false) {
                        $vars[$key] = $client->zip;
                    } elseif (strpos($key, "Country") !== false) {
                        $vars[$key] = $client->country;
                    } elseif (strpos($key, "Phone") !== false) {
                        $vars[$key] = isset($numbers[0]) ? $this->formatPhone(
                            isset($numbers[0]) ? $numbers[0]->number : null,
                            $client->country
                        ) : null;
                    } elseif (strpos($key, "EmailAddress") !== false) {
                        $vars[$key] = $client->email;
                    }
                }

                // Nameservers
                $vars["UseDNS"] = "default";
                for ($i = 1; $i <= 5; $i++) {
                    if (!isset($vars["ns" . $i]) || empty($vars["ns" . $i])) {
                        unset($vars["ns" . $i]);
                    } else {
                        unset($vars["UseDNS"]);
                    }
                }
                $fields = array_intersect_key($vars, $input_fields);

                // Registrant, Admin, Tech and Billing contact information for AddDomain and TransferDomain commands
                foreach ($whois_sections as $key => $contact) {
                    $contact_data[$contact] = [
                        "FIRSTNAME" => $vars[$contact . "FirstName"],
                        "LASTNAME" => $vars[$contact . "LastName"],
                        "STREET" => $vars[$contact . "Address1"],
                        "ORGANIZATION" => $vars[$contact . "Organization"],
                        "CITY" => $vars[$contact . "City"],
                        "STATE" => $vars[$contact . "StateProvince"],
                        "ZIP" => $vars[$contact . "PostalCode"],
                        "COUNTRY" => $vars[$contact . "Country"],
                        "PHONE" => $vars[$contact . "Phone"],
                        "EMAIL" => $vars[$contact . "EmailAddress"],
                    ];
                    if (strlen($vars[$contact . "Address2"])) {
                        $contact_data[$contact]["STREET"] .= " , " . $vars[$contact . "Address2"];
                    }
                }

                if (isset($vars["transfer_key"]) && !empty($vars["transfer_key"])) {
                    //domain transfer pre-check
                    $r = $this->domainManager->call([
                        "COMMAND" => "CheckDomainTransfer",
                        "DOMAIN" => $vars["domain"],
                        "AUTH" => $vars["transfer_key"],
                    ], "/^(200|218)$/");
                    Helper::errorHandler($r);
                    // Handling api errors
                    if ($this->Input->errors()) {
                        return;
                    }

                    $errors = [];
                    if (isset($r["PROPERTY"]["AUTHISVALID"]) && $r["PROPERTY"]["AUTHISVALID"][0] === "NO") {
                        // return custom error message
                        $errors[] = "Invaild Authorization Code";
                    }
                    if (isset($r["PROPERTY"]["TRANSFERLOCK"]) && $r["PROPERTY"]["TRANSFERLOCK"][0] === "1") {
                        // return custom error message
                        $errors[] = "Transferlock is active. Therefore the Domain cannot be transferred.";
                    }
                    if (!empty($errors)) {
                        $this->Input->setErrors([
                            "errors" => $errors,
                        ]);
                        return;
                    }

                    // Handle transfer
                    $command = [
                        "COMMAND" => "TransferDomain",
                        "DOMAIN" => $vars["domain"],
                        "PERIOD" => $vars["NumYears"],
                        "OWNERCONTACT0" => $contact_data["Registrant"],
                        "ADMINCONTACT0" => $contact_data["Admin"],
                        "TECHCONTACT0" => $contact_data["Tech"],
                        "BILLINGCONTACT0" => $contact_data["Billing"],
                        "AUTH" => $vars["transfer_key"],
                    ];
                    for ($i = 1; $i <= 5; $i++) {
                        $key = "ns" . $i;
                        if (!empty($vars[$key])) {
                            $command["NAMESERVER" . ($i - 1)] = $vars[$key];
                        }
                    }

                    if (
                        isset($r["PROPERTY"]["USERTRANSFERREQUIRED"])
                        && $r["PROPERTY"]["USERTRANSFERREQUIRED"][0] === "1"
                    ) {
                        //auto-detect user-transfer
                        $command["ACTION"] = "USERTRANSFER";
                    }

                    //don't send owner admin tech billing contact for .NU .DK .CA, .US, .PT, .NO, .SE, .ES domains
                    //2) do not send contact information for gTLD (Including nTLDs)
                    if (preg_match("/\.([a-z]{3,}(nu|dk|ca|us|pt|no|se|es))$/i", $vars["domain"])) {
                        unset($command["OWNERCONTACT0"]);
                        unset($command["ADMINCONTACT0"]);
                        unset($command["TECHCONTACT0"]);
                        unset($command["BILLINGCONTACT0"]);
                    }
                    //don't send owner billing contact for .FR domains
                    if (preg_match("/\.fr$/i", $vars["domain"])) {
                        unset($command["OWNERCONTACT0"]);
                        unset($command["BILLINGCONTACT0"]);
                    }

                    //auto-detect default transfer period
                    //for example, es, no, nu tlds require period value as zero (free transfers).
                    //in Blesta the default value is based on the package settings for those TLDs created by user
                    $getDomainOptions = $this->domainManager->getDomainOptions($vars["domain"]);
                    Helper::errorHandler($getDomainOptions);

                    if (in_array($vars["NumYears"], $getDomainOptions->transfer->periods)) {
                        $command["PERIOD"] = $vars["NumYears"];
                    } elseif ($r["transfer"]->isFree) {
                        $command["PERIOD"] = "0";
                    } else {
                        $this->Input->setErrors([
                            "errors" => ["Domain Transfer Period is Invalid"]
                        ]);
                        return;
                    }

                    //do not send contact information for gTLD (Including nTLDs)
                    if (preg_match("/\.[a-z]{3,}$/i", $vars["domain"])) {
                        unset($command["OWNERCONTACT0"]);
                        unset($command["ADMINCONTACT0"]);
                        unset($command["TECHCONTACT0"]);
                        unset($command["BILLINGCONTACT0"]);
                    }

                    $r = $this->domainManager->call($command);
                    Helper::errorHandler($r);
                    // Handling api errors
                    if ($this->Input->errors()) {
                        return;
                    }

                    return [
                        [
                            "key" => "domain",
                            "value" => $fields["domain"],
                            "encrypted" => 0,
                        ],
                    ];
                }

                // Handle registration
                $command = [
                    "COMMAND" => "AddDomain",
                    "DOMAIN" => $vars["domain"],
                    "PERIOD" => $vars["NumYears"],
                    "OWNERCONTACT0" => $contact_data["Registrant"],
                    "ADMINCONTACT0" => $contact_data["Admin"],
                    "TECHCONTACT0" => $contact_data["Tech"],
                    "BILLINGCONTACT0" => $contact_data["Billing"],
                ];
                for ($i = 1; $i <= 5; $i++) {
                    $key = "ns" . $i;
                    if (!empty($vars[$key])) {
                        $command["NAMESERVER" . ($i - 1)] = $vars[$key];
                    }
                }

                // Not all TLDs additional fields are like X-<tld>-<something>
                #$tld_pattern = preg_replace("/\./", " ", strtoupper($tld));
                #foreach($vars as $key => $value) {
                #    if (preg_match("/X-".trim($tld_pattern)."/",$key)){
                #        $command[$key] = $value;
                #    }
                #}
                // Considered only "X-<something>" pattern for all fields
                foreach ($vars as $key => $value) {
                    if (preg_match("/^X-(.*)/", $key)) {
                        $command[$key] = $value;
                    }
                }

                $r = $this->domainManager->call($command);
                Helper::errorHandler($r);
                // Handle api errors
                if ($this->Input->errors()) {
                    return;
                }

                // Return domain details when registered successfully
                return [
                    [
                        "key" => "domain",
                        "value" => $vars["domain"],
                        "encrypted" => 0,
                    ],
                ];
            }
        }

        $meta = [];
        $fields = array_intersect_key($vars, $input_fields);
        foreach ($fields as $key => $value) {
            $meta[] = [
                "key" => $key,
                "value" => $value,
                "encrypted" => 0,
            ];
        }

        return $meta;
    }

    /**
     * Edits the service on the remote server. Sets Input errors on failure,
     * preventing the service from being edited.
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $vars An array of user supplied info to satisfy the request
     * @param stdClass $parent_package A stdClass object representing the parent
     *  service's selected package (if the current service is an addon service)
     * @param stdClass $parent_service A stdClass object representing the parent
     *  service of the service being edited (if the current service is an addon service)
     * @return array A numerically indexed array of meta fields to be stored for this service containing:
     *  - key The key for this meta field
     *  - value The value for this key
     *  - encrypted Whether or not this field should be encrypted (default 0, not encrypted)
     * @see Module::getModule()
     * @see Module::getModuleRow()
     */
    public function editService($package, $service, array $vars = [], $parent_package = null, $parent_service = null)
    {
        // Perform manual renewals
        $renew = isset($vars["renew"]) ? (int) $vars["renew"] : 0;
        if ($renew > 0 && $vars["use_module"] == "true") {
            // Call to renewService() to perform manual renewals
            $this->renewService($package, $service, $parent_package, $parent_service, $renew);
            unset($vars["renew"]);
        }
        return null; // All this handled by admin/client tabs instead
    }

    /**
     * Cancels the service on the remote server. Sets Input errors on failure,
     * preventing the service from being canceled.
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param stdClass $parent_package A stdClass object representing the parent
     *  service's selected package (if the current service is an addon service)
     * @param stdClass $parent_service A stdClass object representing the parent
     *  service of the service being canceled (if the current service is an addon service)
     * @return mixed null to maintain the existing meta fields or a numerically
     *  indexed array of meta fields to be stored for this service containing:
     *  - key The key for this meta field
     *  - value The value for this key
     *  - encrypted Whether or not this field should be encrypted (default 0, not encrypted)
     * @see Module::getModule()
     * @see Module::getModuleRow()
     */
    public function cancelService($package, $service, $parent_package = null, $parent_service = null)
    {
        // Set renewal mode to AUTOEXPIRE
        return $this->suspendService($package, $service, $parent_package = null, $parent_service = null);
    }

    /**
     * Suspends the service on the remote server. Sets Input errors on failure,
     * preventing the service from being suspended.
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param stdClass $parent_package A stdClass object representing the parent
     *  service's selected package (if the current service is an addon service)
     * @param stdClass $parent_service A stdClass object representing the parent
     *  service of the service being suspended (if the current service is an addon service)
     * @return mixed null to maintain the existing meta fields or a numerically
     *  indexed array of meta fields to be stored for this service containing:
     *  - key The key for this meta field
     *  - value The value for this key
     *  - encrypted Whether or not this field should be encrypted (default 0, not encrypted)
     * @see Module::getModule()
     * @see Module::getModuleRow()
     */
    public function suspendService($package, $service, $parent_package = null, $parent_service = null)
    {
        // Set renewal mode to AUTOEXPIRE
        if ($package->meta->type === "domain") {
            $row = $this->getModuleRow($service->module_row_id ?? $package->module_row);
            Base::setModule($row);
            Base::moduleInstance($this);
            $fields = $this->serviceFieldsToObject($service->fields);

            $r = $this->domainManager->call([
                "COMMAND" => "SetDomainRenewalMode",
                "DOMAIN" => $fields->domain,
                "RENEWALMODE" => "AUTOEXPIRE",
            ]);
            Helper::errorHandler($r);

            if ($this->Input->errors()) {
                return;
            }
        }

        return null; // Nothing to do
    }

    /**
     * Allows the module to perform an action when the service is ready to renew.
     * Sets Input errors on failure, preventing the service from renewing.
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param stdClass $parent_package A stdClass object representing the parent
     *  service's selected package (if the current service is an addon service)
     * @param stdClass $parent_service A stdClass object representing the parent
     *  service of the service being renewed (if the current service is an addon service)
     * @return mixed null to maintain the existing meta fields or a numerically
     *  indexed array of meta fields to be stored for this service containing:
     *  - key The key for this meta field
     *  - value The value for this key
     *  - encrypted Whether or not this field should be encrypted (default 0, not encrypted)
     * @see Module::getModule()
     * @see Module::getModuleRow()
     */
    public function renewService($package, $service, $parent_package = null, $parent_service = null, $years = null)
    {
        // Return if service type not domain
        if ($package->meta->type !== "domain") {
            return null;
        }

        // Credentials to API
        $row = $this->getModuleRow($service->module_row_id ?? $package->module_row);
        Base::setModule($row);
        Base::moduleInstance($this);
        $fields = $this->serviceFieldsToObject($service->fields);

        $vars = [
            "domain" => $fields->{"domain"},
            "years" => 1
        ];

        if (!$years) {
            foreach ($package->pricing as $pricing) {
                if ($pricing->id == $service->pricing_id) {
                    $vars["years"] = $pricing->term;
                    break;
                }
            }
        } else {
            $vars["years"] = $years;
        }

        // Renew the domain
        $r = $this->domainManager->call([
            "COMMAND" => "RenewDomain",
            "DOMAIN" => $vars["domain"],
            "PERIOD" => $vars["years"],
        ]);

        // Some of the TLDs require following command for renewals (eg: .de)
        if ($r["CODE"] === "510") {
            // clear errors from previous call
            $this->Input->setErrors([]);
            $this->domainManager->call([
                "COMMAND" => "PayDomainRenewal",
                "DOMAIN" => $vars["domain"],
                "PERIOD" => $vars["years"],
            ]);
        }

        if (!Helper::errorHandler($r)) {
            return;
        }

        return null;
    }

    // public function renewDomain($domain, $module_row_id = null, array $vars = [])
    // {
    //     $row = $this->getModuleRow($module_row_id);
    //     // Renew the domain
    //     $r = $this->base->call([
    //         "COMMAND" => "RenewDomain",
    //         "DOMAIN" => $domain,
    //         "PERIOD" => $vars["qty"] ?? $vars["years"] ?? 1,
    //     ], $row);

    //     // Some of the TLDs require following command for renewals (eg: .de)
    //     if ($r["CODE"] === "510") {
    //         // clear errors from previous call
    //         $this->Input->setErrors([]);
    //         $this->base->call([
    //             "COMMAND" => "PayDomainRenewal",
    //             "DOMAIN" => $vars["domain"],
    //             "PERIOD" => $vars["qty"] ?? $vars["years"] ?? 1,
    //         ], $row);
    //     }

    //     if ($this->Input->errors()) {
    //         return;
    //     }
    // }

    /**
     * Validates input data when attempting to add a package, returns the meta
     * data to save when adding a package. Performs any action required to add
     * the package on the remote server. Sets Input errors on failure,
     * preventing the package from being added.
     *
     * @param array An array of key/value pairs used to add the package
     * @return array A numerically indexed array of meta fields to be stored for this package containing:
     *  - key The key for this meta field
     *  - value The value for this key
     *  - encrypted Whether or not this field should be encrypted (default 0, not encrypted)
     * @see Module::getModule()
     * @see Module::getModuleRow()
     */
    public function addPackage(array $vars = null)
    {
        $meta = [];
        if (isset($vars["meta"]) && is_array($vars["meta"])) {
            // Return all package meta fields
            foreach ($vars["meta"] as $key => $value) {
                $meta[] = [
                    "key" => $key,
                    "value" => $value,
                    "encrypted" => 0,
                ];
            }
        }

        return $meta;
    }

    /**
     * Validates input data when attempting to edit a package, returns the meta
     * data to save when editing a package. Performs any action required to edit
     * the package on the remote server. Sets Input errors on failure,
     * preventing the package from being edited.
     *
     * @param stdClass $package A stdClass object representing the selected package
     * @param array An array of key/value pairs used to edit the package
     * @return array A numerically indexed array of meta fields to be stored for this package containing:
     *  - key The key for this meta field
     *  - value The value for this key
     *  - encrypted Whether or not this field should be encrypted (default 0, not encrypted)
     * @see Module::getModule()
     * @see Module::getModuleRow()
     */
    public function editPackage($package, array $vars = null)
    {
        $meta = [];
        if (isset($vars["meta"]) && is_array($vars["meta"])) {
            // Return all package meta fields
            foreach ($vars["meta"] as $key => $value) {
                $meta[] = [
                    "key" => $key,
                    "value" => $value,
                    "encrypted" => 0,
                ];
            }
        }
        return $meta;
    }

    /**
     * Returns the rendered view of the manage module page
     *
     * @param mixed $module A stdClass object representing the module and its rows
     * @param array $vars An array of post data submitted to or on the manage
     *  module page (used to repopulate fields after an error)
     * @return string HTML content containing information to display when viewing the manager module page
     */
    public function manageModule($module, array &$vars)
    {
        // TODO here we can introduce our own logic / action to
        // * manage packages
        // * add a manual sync
        // * audit domains
        // * etc.

        // Load the view into this object, so helpers can be automatically added to the view
        $this->view = new View("manage", "default");
        $this->view->base_uri = $this->base_uri;
        $this->view->setDefaultView(self::$defaultModuleView);

        // Load the helpers required for this view
        Loader::loadHelpers($this, ["Form", "Html", "Widget"]);

        $this->view->set("module", $module);

        return $this->view->fetch();
    }

    /**
     * Returns the rendered view of the add module row page (add account)
     *
     * @param array $vars An array of post data submitted to or on the add
     *  module row page (used to repopulate fields after an error)
     * @return string HTML content containing information to display when viewing the add module row page
     */
    public function manageAddRow(array &$vars)
    {
        // TODO here we can introduce our own logic / action to
        // * manage packages
        // * add a manual sync
        // * audit domains
        // * etc.

        // Load the view into this object, so helpers can be automatically added to the view
        $this->view = new View("add_row", "default");
        $this->view->base_uri = $this->base_uri;
        $this->view->setDefaultView(self::$defaultModuleView);

        // Load the helpers required for this view
        Loader::loadHelpers($this, ["Form", "Html", "Widget"]);

        // Set unspecified checkboxes
        if (!empty($vars) && empty($vars["sandbox"])) {
            $vars["sandbox"] = "false";
        }

        // Set unspecified checkboxes
        if (!empty($vars) && empty($vars["dnssec"])) {
            $vars["dnssec"] = "false";
        }

        $this->view->set("vars", (object) $vars);

        return $this->view->fetch();
    }

    /**
     * Returns the rendered view of the edit module row page
     *
     * @param stdClass $module_row The stdClass representation of the existing module row
     * @param array $vars An array of post data submitted to or on the edit
     *  module row page (used to repopulate fields after an error)
     * @return string HTML content containing information to display when viewing the edit module row page
     */
    public function manageEditRow($module_row, array &$vars)
    {
        // Load the view into this object, so helpers can be automatically added to the view
        // TODO: unable use password field for key/password
        $this->view = new View("edit_row", "default");
        $this->view->base_uri = $this->base_uri;
        $this->view->setDefaultView(self::$defaultModuleView);

        // Load the helpers required for this view
        Loader::loadHelpers($this, ["Form", "Html", "Widget"]);

        if (empty($vars)) {
            $vars = $module_row->meta;
        } elseif (empty($vars["sandbox"])) {
            // Set unspecified checkboxes
            $vars["sandbox"] = "false";
        } elseif (empty($vars["dnssec"])) {
            // Set unspecified checkboxes
            $vars["dnssec"] = "false";
        }

        $this->view->set("vars", (object) $vars);
        return $this->view->fetch();
    }

    /**
     * Adds the module row on the remote server. Sets Input errors on failure,
     * preventing the row from being added.
     *
     * @param array $vars An array of module info to add
     * @return array A numerically indexed array of meta fields for the module row containing:
     *  - key The key for this meta field
     *  - value The value for this key
     *  - encrypted Whether or not this field should be encrypted (default 0, not encrypted)
     */
    public function addModuleRow(array &$vars, $module_row_id = null)
    {
        // TODO maybe syncing services
        $meta_fields = [
            "user" => 0,
            "key" => 1,
            "sandbox" => 0,
            "dnssec" => 0
        ]; //TODO maybe extending this

        // Set unspecified checkboxes
        if (empty($vars["sandbox"])) {
            $vars["sandbox"] = "false";
        }

        // Set unspecified checkboxes
        if (empty($vars["dnssec"])) {
            $vars["dnssec"] = "false";
        }

        Base::moduleInstance($this);
        $this->Input->setRules(Helper::getRowRules($vars, $module_row_id));

        // Validate module row
        if ($this->Input->validates($vars)) {
            // Build the meta data for this row
            $meta = [];
            foreach ($vars as $key => $value) {
                if (array_key_exists($key, $meta_fields)) {
                    $meta[] = [
                        "key" => $key,
                        "value" => $value,
                        "encrypted" => $meta_fields[$key]
                    ];
                }
            }

            return $meta;
        }
    }

    /**
     * Edits the module row on the remote server. Sets Input errors on failure,
     * preventing the row from being updated.
     *
     * @param stdClass $module_row The stdClass representation of the existing module row
     * @param array $vars An array of module info to update
     * @return array A numerically indexed array of meta fields for the module row containing:
     *  - key The key for this meta field
     *  - value The value for this key
     *  - encrypted Whether or not this field should be encrypted (default 0, not encrypted)
     */
    public function editModuleRow($module_row, array &$vars)
    {
        return $this->addModuleRow($vars, $module_row->module_id ?? null);
    }

    /**
     * Returns the value used to identify a particular service (eg: domain name)
     *
     * @param stdClass $service A stdClass object representing the service
     * @return string A value used to identify this service amongst other similar services
     */
    public function getServiceName($service)
    {
        foreach ($service->fields as $field) {
            if ($field->key === "domain") {
                return $field->value;
            }
        }
        return null;
    }

    /**
     * Returns the value used to identify a particular package service which has
     * not yet been made into a service. This may be used to uniquely identify
     * an uncreated services of the same package (i.e. in an order form checkout)
     *
     * @param stdClass $package A stdClass object representing the selected package
     * @param array $vars An array of user supplied info to satisfy the request
     * @return string The value used to identify this package service
     * @see Module::getServiceName()
     */
    public function getPackageServiceName($packages, array $vars = null)
    {
        return (isset($vars["domain"])) ? $vars["domain"] : null;
    }

    /**
     * Unsuspends the service on the remote server. Sets Input errors on failure,
     * preventing the service from being unsuspended.
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param stdClass $parent_package A stdClass object representing the parent
     *  service's selected package (if the current service is an addon service)
     * @param stdClass $parent_service A stdClass object representing the parent
     *  service of the service being unsuspended (if the current service is an addon service)
     * @return mixed null to maintain the existing meta fields or a numerically
     *  indexed array of meta fields to be stored for this service containing:
     *  - key The key for this meta field
     *  - value The value for this key
     *  - encrypted Whether or not this field should be encrypted (default 0, not encrypted)
     * @see Module::getModule()
     * @see Module::getModuleRow()
     */
    public function unsuspendService($package, $service, $parent_package = null, $parent_service = null)
    {
        return null; // Nothing to do
    }

    /**
     * Updates the package for the service on the remote server. Sets Input
     * errors on failure, preventing the service's package from being changed.
     *
     * @param stdClass $package_from A stdClass object representing the current package
     * @param stdClass $package_to A stdClass object representing the new package
     * @param stdClass $service A stdClass object representing the current service
     * @param stdClass $parent_package A stdClass object representing the parent
     *  service's selected package (if the current service is an addon service)
     * @param stdClass $parent_service A stdClass object representing the parent
     *  service of the service being changed (if the current service is an addon service)
     * @return mixed null to maintain the existing meta fields or a numerically
     *  indexed array of meta fields to be stored for this service containing:
     *  - key The key for this meta field
     *  - value The value for this key
     *  - encrypted Whether or not this field should be encrypted (default 0, not encrypted)
     * @see Module::getModule()
     * @see Module::getModuleRow()
     */
    public function changeServicePackage(
        $package_from,
        $package_to,
        $service,
        $parent_package = null,
        $parent_service = null
    ) {
        return null; // Nothing to do
    }

    /**
     * Deletes the module row on the remote server. Sets Input errors on failure,
     * preventing the row from being deleted.
     *
     * @param stdClass $module_row The stdClass representation of the existing module row
     */
    public function deleteModuleRow($module_row)
    {
        //
    }

    /**
     * Returns all fields used when adding/editing a package, including any
     * javascript to execute when the page is rendered with these fields.
     *
     * @param $vars stdClass A stdClass object representing a set of post fields
     * @return ModuleFields A ModuleFields object, containg the fields to render
     *  as well as any additional HTML markup to include
     */
    public function getPackageFields($vars = null)
    {
        Loader::loadHelpers($this, ["Html"]);

        // TODO loading packages available for server/server grp
        $fields = new ModuleFields();

        $types = [
            "domain" => Language::_("Ispapi.package_fields.type_domain", true),
        ];

        // Set type of package
        $type = $fields->label(Language::_("Ispapi.package_fields.type", true), "ispapi_type");

        $type->attach(
            $fields->fieldSelect(
                "meta[type]",
                $types,
                $vars->meta["type"] ?? null,
                ["id" => "ispapi_type"]
            )
        );
        $fields->setField($type);

        // Set all TLDs
        $tld_options = $fields->label(Language::_("Ispapi.package_fields.tld_options", true));

        $tlds = $this->getTlds();

        // Set all TLDs Dropdown
        // TODO may improve by setting labels
        foreach ($tlds as $key => $val) {
            $tlds_array[$val] = $val;
        }
        $tld_options->attach(
            //TODO fieldCheckbox ?
            $fields->fieldSelect(
                "meta[tlds][]",
                $tlds_array,
                $vars->meta["tlds"] ?? null,
                ["id" => "tlds"]
            )
        );

        $fields->setField($tld_options);

        // Set nameservers
        for ($i = 1; $i <= 5; $i++) {
            $type = $fields->label(Language::_("Ispapi.package_fields.ns" . $i, true), "ispapi_ns" . $i);
            $type->attach(
                $fields->fieldText(
                    "meta[ns][]",
                    $vars->meta["ns"][$i - 1] ?? null,
                    ["id" => "ispapi_ns" . $i]
                )
            );
            $fields->setField($type);
        }

        $fields->setHtml("
			<script type=\"text/javascript\">
				$(document).ready(function() {
					toggleTldOptions($('#ispapi_type').val());

					// Re-fetch module options to pull cPanel packages and ACLs
					$('#ispapi_type').change(function() {
						toggleTldOptions($(this).val());
					});

					function toggleTldOptions(type) {
						if (type === 'ssl')
							$('.ispapi_tlds').hide();
						else
							$('.ispapi_tlds').show();
					}
				});
			</script>
        ");

        return $fields;
    }

    /**
     * Returns all fields to display to an admin attempting to add a service with the module
     *
     * @param stdClass $package A stdClass object representing the selected package
     * @param $vars stdClass A stdClass object representing a set of post fields
     * @return ModuleFields A ModuleFields object, containg the fields to render as
     *  well as any additional HTML markup to include
     */
    public function getAdminAddFields($package, $vars = null)
    {
        Loader::loadHelpers($this, ["Form", "Html"]);

        // TODO separate handling of transfer request
        if ($package->meta->type !== "domain") {
            return new ModuleFields();
        }

        // Set default name servers
        if (!isset($vars->ns1) && isset($package->meta->ns)) {
            $i = 1;
            foreach ($package->meta->ns as $ns) {
                $vars->{"ns" . $i++} = $ns;
            }
        }

        $fields = [
            "domainoptions" => [
                "label" => Language::_("Ispapi.domain.DomainAction", true),
                "type" => "radio",
                "value" => "1",
                "options" => [
                    "1" => "Register",
                    "2" => "Transfer",
                ],
            ],
            "domain" => [
                "label" => Language::_("Ispapi.domain.domain", true),
                "type" => "text",
            ],
            "transfer_key" => [
                "label" => Language::_("Ispapi.transfer.EPPCode", true),
                "type" => "text",
            ],
        ];
        //TODO: we might work on NS Fields

        // Handle transfer request
        if ((isset($vars->transfer) && $vars->transfer === "true") || !empty($vars->transfer_key)) {
            return $this->arrayToModuleFields(array_merge(
                $fields,
                Configure::get("Ispapi.transfer_fields"),
                Configure::get("Ispapi.nameserver_fields")
            ), null, $vars);
        }

        // Handle domain registration
        $module_fields = $this->arrayToModuleFields(array_merge(
            $fields,
            Configure::get("Ispapi.nameserver_fields")
        ), null, $vars);

        // Additional domain fields
        if (isset($vars->domain)) {
            $tld = $this->getTld($vars->domain);

            if ($tld) {
                $extension_fields = array_merge(
                    (array) Configure::get("Ispapi.domain_fields" . $tld),
                    (array) Configure::get("Ispapi.contact_fields" . $tld)
                );
                if ($extension_fields) {
                    $module_fields = $this->arrayToModuleFields($extension_fields, $module_fields, $vars);
                }
            }
        }

        $module_fields->setHtml("
            <script type=\"text/javascript\">
                $(document).ready(function() {
                    $('#domainoptions_id').prop('checked', true);
                    $('#transfer_key_id').closest('li').hide();
                    // Set whether to show or hide the ACL option
                    $('#transfer_key_id').closest('li').hide();
                    $('input[name=\"domainoptions\"]').change(function() {
                        if ($(this).val() == '2')
                            $('#transfer_key_id').closest('li').show();
                        else
                            $('#transfer_key_id').closest('li').hide();
                    });
                    // Refresh the page when typed in domain name in in order to display additional fields
                    $('input[name=\"domain\"]').change(function(event) {
                        // do not refresh if domain has not actually changed (some change events are triggered automatically)
                        if (event.target.value.toLowerCase() === '" . ($vars->domain ?? '') . "'.toLowerCase()) return;
                        $('input[type=radio]').attr('checked',false);
                        var form = $(this).closest('form');
                        $(form).append('<input type=\"hidden\" name=\"refresh_fields\" value=\"true\">');
                        $(form).submit();
                    });
                });
            </script>
        ");

        //TODO Build the domain fields
        /*$fields = $this->buildDomainModuleFields($vars);
        if ($fields) {
        $module_fields = $fields;
        }*/
        return $module_fields;
    }

    /**
     * Returns all fields to display to a client attempting to add a service with the module
     *
     * @param stdClass $package A stdClass object representing the selected package
     * @param $vars stdClass A stdClass object representing a set of post fields
     * @return ModuleFields A ModuleFields object, containg the fields to render
     *  as well as any additional HTML markup to include
     */
    public function getClientAddFields($package, $vars = null)
    {
        // Handle domain name
        if (isset($vars->domain)) {
            $vars->domain = $vars->domain;
        }

        if ($package->meta->type !== "domain") {
            return new ModuleFields();
        }
        // Set default name servers
        if (!isset($vars->ns) && isset($package->meta->ns)) {
            $i = 1;
            foreach ($package->meta->ns as $ns) {
                $vars->{"ns" . $i++} = $ns;
            }
        }

        // Handle transfer request
        if (isset($vars->transfer) || isset($vars->transfer_key)) {
            $fields = array_merge(
                Configure::get("Ispapi.transfer_fields"),
                Configure::get("Ispapi.nameserver_fields")
            );

            // TODO: check .ca for whois privacy service
            // shouldn't be supported
            // $fields["private"]

            // Already have the domain name don't make editable
            $fields["domain"]["type"] = "hidden";
            $fields["domain"]["label"] = null;

            return $this->arrayToModuleFields($fields, null, $vars);
        }
        // Handle domain registration
        $fields = array_merge(
            Configure::get("Ispapi.nameserver_fields"),
            Configure::get("Ispapi.domain_fields")
        );

        // TODO: check .ca for whois privacy service
        // shouldn't be supported
        // $fields["private"]

        // Already have the domain name don't make editable
        $fields["domain"]["type"] = "hidden";
        $fields["domain"]["label"] = null;

        $module_fields = $this->arrayToModuleFields($fields, null, $vars);

        if (isset($vars->domain)) {
            $tld = $this->getTld($vars->domain);

            $extension_fields = Configure::get("Ispapi.domain_fields" . $tld);
            if ($extension_fields) {
                $module_fields = $this->arrayToModuleFields($extension_fields, $module_fields, $vars);
            }
        }

        return $module_fields;
    }

    /**
     * Returns all fields to display to an admin attempting to edit a service with the module
     *
     * @param stdClass $package A stdClass object representing the selected package
     * @param $vars stdClass A stdClass object representing a set of post fields
     * @return ModuleFields A ModuleFields object, containg the fields to render
     *  as well as any additional HTML markup to include
     */
    public function getAdminEditFields($package, $vars = null)
    {
        Loader::loadHelpers($this, ['Html']);
        Loader::loadComponents($this, ['Record']);

        $fields = new ModuleFields();

        // Create domain label
        $domain = $fields->label(Language::_("Ispapi.manage.manual_renewal", true), "renew");
        Base::setModule($this->getModuleRow($package->module_row));
        Base::moduleInstance($this);

        // Supported renewal periods of TLD
        $getDomainOptions = $this->domainManager->getDomainOptions($vars->domain);
        Helper::errorHandler($getDomainOptions);

        // renewal periods
        $renewalPeriods = $getDomainOptions->renewal->periods;
        $renewalPeriodList = [];
        foreach ($renewalPeriods as $period) {
            // User friendly format for the renewal period based on the numerical value.
            $formattedPeriod = $period <= 2 ? "{$period} year" : "{$period} years";

            // Formatted renewal period in the list for select field
            $renewalPeriodList[$period] = $formattedPeriod;
        }

        // Create domain field and attach to domain label
        $domain->attach($fields->fieldSelect("renew", $renewalPeriodList, ["id" => "renew"]));
        $fields->setField($domain);

        // Display domain information
        $domain_information = $fields->label(Language::_("Ispapi.domain.domaininformation", true), "domaininformation");
        $domain_information->attach(
            $fields->fieldText(
                ["id" => "domain"],
                ["value" => $vars->domain],
                ["type" => "hidden"]
            )
        );
        // Domain status
        $domain_status = $fields->label(Language::_("Ispapi.domain.domainstatus", true), "domainstatus");
        // Expiry date
        $expirydate = $fields->label(Language::_("Ispapi.domain.expirydate", true), "expirydate");

        if ($package->meta->type === "domain") {
            $r = $this->domainManager->getDomainStatusCached($vars->domain);
            if (!Helper::errorHandler($r)) {
                return;
            }

            if ($r["CODE"] === "200") {
                // Expiry date at our system [HM-696]
                $r = $r["PROPERTY"];

                $expirationdate = $r["DOMAINEXPIRATIONDATE"][0];
                $expirationts = strtotime($expirationdate);
                $finalizationdate = $r["DOMAINFINALIZATIONDATE"][0];
                $paiduntildate = $r["DOMAINPAIDUNTILDATE"][0];
                $failuredate = $r["DOMAINFAILUREDATE"][0];

                // Status of the domain at our system
                if (preg_match("/ACTIVE/i", $r["STATUS"][0])) {
                    $values["status"] = "Active";
                }

                if (preg_match("/DELETE/i", $r["STATUS"][0])) {
                    $values["expirydate"] = preg_replace("/ .*$/", "", $expirationdate);
                    $values["status"] = "Expired";
                }

                if ($failuredate > $paiduntildate) {
                    $values["expirydate"] = preg_replace("/ .*$/", "", $paiduntildate);
                } else {
                    $finalizationts = strtotime($finalizationdate);
                    $paiduntilts = strtotime($paiduntildate);
                    $expirationts = $finalizationts + ($paiduntilts - $expirationts);
                    $values["expirydate"] = date("Y-m-d", $expirationts);
                }
            }

            $domain_status->attach(
                $fields->fieldText(
                    (isset($values["status"]) ? $values["status"] : ""),
                    ["id" => $values["status"]],
                    ["readonly" => "readonly"]
                )
            );
            $expirydate->attach(
                $fields->fieldText(
                    (isset($values["expirydate"]) ? $values["expirydate"] : ""),
                    ["id" => $values["expirydate"]],
                    ["readonly" => "readonly"]
                )
            );
        }

        if (!isset($_POST["submit"])) {
            $fields->setField($domain_information);
            $fields->setField($domain_status);
            $fields->setField($expirydate);
        }

        // #return $fields;
        return (isset($fields) ? $fields : new ModuleFields());
    }

    /**
     * Fetches the HTML content to display when viewing the service info in the
     * admin interface.
     *
     * @param stdClass $service A stdClass object representing the service
     * @param stdClass $package A stdClass object representing the service's package
     * @return string HTML content containing information to display when viewing the service info
     */
    public function getAdminServiceInfo($service, $package)
    {
        return "";
    }

    /**
     * Fetches the HTML content to display when viewing the service info in the
     * client interface.
     *
     * @param stdClass $service A stdClass object representing the service
     * @param stdClass $package A stdClass object representing the service's package
     * @return string HTML content containing information to display when viewing the service info
     */
    public function getClientServiceInfo($service, $package)
    {
        return "";
    }

    /**
     * Returns all tabs to display to a client when managing a service.
     *
     * @param stdClass $service A stdClass object representing the service
     * @return array An array of tabs in the format of method => title, or method => array where array contains:
     *
     *  - name (required) The name of the link
     *  - icon (optional) use to display a custom icon
     *  - href (optional) use to link to a different URL
     *      Example:
     *      ['methodName' => "Title", 'methodName2' => "Title2"]
     *      ['methodName' => ['name' => "Title", 'icon' => "icon"]]
     */
    public function getClientServiceTabs($service)
    {
        Loader::loadModels($this, ['Packages']);

        $package = $this->Packages->get($service->package_id ?? $service->package->id);

        if ($package->meta->type == 'domain') {
            $tabs = [
                'tabClientWhois' => [
                    'name' => Language::_('Ispapi.tab_whois.title', true),
                    'icon' => 'fas fa-users'
                ],
                'tabClientEmailForwarding' => [
                    'name' => Language::_('Ispapi.tab_email_forwarding.title', true),
                    'icon' => 'fas fa-envelope'
                ],
                'tabClientNameservers' => [
                    'name' => Language::_('Ispapi.tab_nameservers.title', true),
                    'icon' => 'fas fa-server'
                ],
                'tabClientPrivateNameservers' => [
                    'name' => Language::_('Ispapi.tab_private_nameservers.title', true),
                    'icon' => 'fas fa-hdd'
                ],
                'tabClientDnsRecords' => [
                    'name' => Language::_('Ispapi.tab_dnsrecord.title', true),
                    'icon' => 'fas fa-sitemap'
                ],
                'tabClientDnssec' => [
                    'name' => Language::_('Ispapi.tab_dnssec.title', true),
                    'icon' => 'fas fa-globe-americas'
                ],
                'tabClientSettings' => [
                    'name' => Language::_('Ispapi.tab_settings.title', true),
                    'icon' => 'fas fa-cog'
                ]
            ];

            // Check if DNS Management is enabled
            if (!$this->featureServiceEnabled('dns_management', $service)) {
                unset($tabs['tabClientDnsRecords']);
            }

            // Check if Email Forwarding is enabled
            if (!$this->featureServiceEnabled('email_forwarding', $service)) {
                unset($tabs['tabClientEmailForwarding']);
            }

            // Check if DNSSEC is enabled
            if (!$this->featureServiceEnabled('dnssec', $service)) {
                unset($tabs['tabClientDnssec']);
            }

            return $tabs;
        }
    }

    /**
     * Client DNS Records tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabClientDnsRecords($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->manageDnsRecords('tab_client_dnsrecords', $package, $service, $get, $post, $files);
    }

    /**
     * Client DNS Sec tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabClientDnssec($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->manageDnssec('tab_client_dnssec', $package, $service, $get, $post, $files);
    }

    /**
     * Client Hosts tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabClientPrivateNameservers($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->managePrivateNameServers('tab_client_private_nameservers', $package, $service, $get, $post, $files);
    }

    /**
     * Admin Whois tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabWhois($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->manageWhois("tab_whois", $package, $service, $get, $post, $files);
    }

    /**
     * Client Whois tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabClientWhois($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->manageWhois("tab_client_whois", $package, $service, $get, $post, $files);
    }

    /**
     * Admin Private/Custom Nameservers tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabPrivateNameservers($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->managePrivateNameservers('tab_private_nameservers', $package, $service, $get, $post, $files);
    }


    /**
     * Admin DNSSEC tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabDnssec($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->manageDnssec('tab_dnssec', $package, $service, $get, $post, $files);
    }

    /**
     * Admin Nameservers tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabNameservers($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->manageNameservers("tab_nameservers", $package, $service, $get, $post, $files);
    }

    /**
     * Admin Nameservers tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabClientNameservers($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->manageNameservers("tab_client_nameservers", $package, $service, $get, $post, $files);
    }

    /**
     * Admin Settings tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabSettings($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->manageSettings("tab_settings", $package, $service, $get, $post, $files);
    }

    /**
     * Client Settings tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabClientSettings($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->manageSettings("tab_client_settings", $package, $service, $get, $post, $files);
    }

    /**
     * Handle updating whois information
     *
     * @param string $view The view to use
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    private function manageWhois($view, $package, $service, array $get = null, array $post = null, array $files = null)
    {
        $this->view = new View($view, "default");
        // Load the helpers required for this view
        Loader::loadHelpers($this, ["Form", "Html"]);

        $row = $this->getModuleRow($service->module_row_id ?? $package->module_row);
        Base::setModule($row);
        Base::moduleInstance($this);

        $vars = new stdClass();

        $whois_fields = Configure::get("Ispapi.whois_fields");

        $fields = $this->serviceFieldsToObject($service->fields);

        $whois_sections = Configure::get("Ispapi.whois_sections");

        $tld = trim($this->getTld($fields->domain), ".");
        $sld = trim(substr($fields->domain, 0, -strlen($tld)), ".");

        if (!empty($post)) {
            // Modify/update contact/whois information
            $command = [
                "COMMAND" => "ModifyDomain",
                "DOMAIN" => $fields->domain,
            ];
            $map = [
                "OWNERCONTACT0" => "Registrant",
                "ADMINCONTACT0" => "Admin",
                "TECHCONTACT0" => "Tech",
                "BILLINGCONTACT0" => "Billing",
            ];

            foreach ($map as $ctype => $ptype) {
                $command[$ctype] = [
                    "FIRSTNAME" => html_entity_decode($post[$ptype . "FirstName"], ENT_QUOTES | ENT_XML1, "UTF-8"),
                    "LASTNAME" => html_entity_decode($post[$ptype . "LastName"], ENT_QUOTES | ENT_XML1, "UTF-8"),
                    "ORGANIZATION" => html_entity_decode($post[$ptype . "Organization"], ENT_QUOTES | ENT_XML1, "UTF-8"),
                    "STREET" => html_entity_decode($post[$ptype . "Address1"], ENT_QUOTES | ENT_XML1, "UTF-8"),
                    "CITY" => html_entity_decode($post[$ptype . "City"], ENT_QUOTES | ENT_XML1, "UTF-8"),
                    "STATE" => html_entity_decode($post[$ptype . "StateProvince"], ENT_QUOTES | ENT_XML1, "UTF-8"),
                    "ZIP" => html_entity_decode($post[$ptype . "PostalCode"], ENT_QUOTES | ENT_XML1, "UTF-8"),
                    "COUNTRY" => html_entity_decode($post[$ptype . "Country"], ENT_QUOTES | ENT_XML1, "UTF-8"),
                    "PHONE" => html_entity_decode($post[$ptype . "Phone"], ENT_QUOTES | ENT_XML1, "UTF-8"),
                    "EMAIL" => html_entity_decode($post[$ptype . "EmailAddress"], ENT_QUOTES | ENT_XML1, "UTF-8"),
                ];
                if (strlen($post[$ptype . "Address2"])) {
                    $command[$ctype]["STREET"] .= " , " . html_entity_decode($post[$ptype . "Address2"], ENT_QUOTES | ENT_XML1, "UTF-8");
                }
            }
            $this->domainManager->call($command);

            $vars = (object) $post;
        } else {
            // To get the contact details of a domain, first perform a StatusDomain command and then use the data from StatusDomain to perform the StatusContact command.
            $r = $this->domainManager->call([
                "COMMAND" => "StatusDomain",
                "DOMAIN" => $fields->domain,
            ]);

            if ($r["CODE"] === "200") {
                $contacts_array = [
                    "Registrant" => $r["PROPERTY"]["OWNERCONTACT"][0],
                    "Admin" => $r["PROPERTY"]["ADMINCONTACT"][0],
                    "Tech" => $r["PROPERTY"]["TECHCONTACT"][0],
                    "Billing" => $r["PROPERTY"]["BILLINGCONTACT"][0],
                ];
                foreach ($contacts_array as $key => $contact) {
                    $r = $this->domainManager->call([
                        "COMMAND" => "StatusContact",
                        "CONTACT" => $contact,
                    ]);

                    if ($r["CODE"] === "200") {
                        $data[$key] = $r["PROPERTY"];
                    }
                }
                // Display owner, tech and billing contact details
                foreach ($whois_sections as $section) {
                    if (isset($data[$section])) {
                        foreach ($data[$section] as $name) {
                            $vars->{$section . "FirstName"} = ($data[$section]["FIRSTNAME"] ? $data[$section]["FIRSTNAME"][0] : "");
                            $vars->{$section . "LastName"} = ($data[$section]["LASTNAME"] ? $data[$section]["LASTNAME"][0] : "");
                            $vars->{$section . "Organization"} = ($data[$section]["ORGANIZATION"] ? $data[$section]["ORGANIZATION"][0] : "");
                            if ((count($data[$section]["STREET"]) < 2) && preg_match("/^(.*) , (.*)/", $data[$section]["STREET"][0], $m)) {
                                $vars->{$section . "Address1"} = $m[1];
                                $vars->{$section . "Address2"} = $m[2];
                            } else {
                                $vars->{$section . "Address1"} = ($data[$section]["STREET"] ? $data[$section]["STREET"][0] : "");
                            }
                            $vars->{$section . "City"} = ($data[$section]["CITY"] ? $data[$section]["CITY"][0] : "");
                            $vars->{$section . "StateProvince"} = ($data[$section]["STATE"] ? $data[$section]["STATE"][0] : "");
                            $vars->{$section . "PostalCode"} = ($data[$section]["ZIP"] ? $data[$section]["ZIP"][0] : "");
                            $vars->{$section . "Country"} = ($data[$section]["COUNTRY"] ? $data[$section]["COUNTRY"][0] : "");
                            $vars->{$section . "Phone"} = ($data[$section]["PHONE"] ? $data[$section]["PHONE"][0] : "");
                            $vars->{$section . "EmailAddress"} = ($data[$section]["EMAIL"] ? $data[$section]["EMAIL"][0] : "");
                        }
                    }
                }
            }
        }

        $this->view->set("vars", $vars);
        $this->view->set("fields", $this->arrayToModuleFields($whois_fields, null, $vars)->getFields());
        $this->view->set("sections", ["Registrant", "Admin", "Tech", "Billing"]);
        $this->view->setDefaultView(self::$defaultModuleView);
        return $this->view->fetch();
    }

    /**
     * Handle updating nameserver information
     *
     * @param string $view The view to use
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    private function manageNameservers(
        $view,
        $package,
        $service,
        array $get = null,
        array $post = null,
        array $files = null
    ) {
        $this->view = new View($view, "default");

        // Load the helpers required for this view
        Loader::loadHelpers($this, ["Form", "Html"]);

        Base::setModule($this->getModuleRow($package->module_row));
        Base::moduleInstance($this);
        $fields = $this->serviceFieldsToObject($service->fields);

        if (!empty($post)) {
            // Changes have been sent
            // Modify and save nameservers
            $command = [
                "COMMAND" => "ModifyDomain",
                "DOMAIN" => $fields->domain,
                "INTERNALDNS" => 1,
            ];
            foreach ($post["ns"] as $i => $ns) {
                if (!empty($ns)) {
                    $command["NAMESERVER" . $i] = $ns;
                }
            }
            $this->domainManager->call($command);
        }

        // Get nameservers
        $r = $this->domainManager->call([
            "COMMAND" => "StatusDomain",
            "DOMAIN" => $fields->domain,
        ]);

        $vars = new stdClass();
        if ($r["CODE"] === "200" && isset($r["PROPERTY"]["NAMESERVER"])) {
            $vars->ns = $r["PROPERTY"]["NAMESERVER"];
        }

        $this->view->set("vars", $vars);
        $this->view->setDefaultView(self::$defaultModuleView);
        return $this->view->fetch();
    }

    /**
     * Set Domain Nameservers
     *
     * @param string $domain
     * @param int $module_row_id
     * @param array $nameservers
     * @return boolean
     */
    public function setDomainNameservers($domain, $module_row_id = null, array $nameservers = [])
    {
        Base::setModule($this->getModuleRow($module_row_id));
        Base::moduleInstance($this);

        if (!empty($nameservers)) {
            // Modify and save nameservers
            $command = [
                "COMMAND" => "ModifyDomain",
                "DOMAIN" => $domain,
                "INTERNALDNS" => 1,
            ];
            foreach ($nameservers as $i => $ns) {
                if (!empty($ns)) {
                    $command["NAMESERVER" . $i] = $ns;
                }
            }
            $r = $this->domainManager->call($command);
            if (!Helper::errorHandler($r)) {
                return;
            }
        }

        return false;
    }

    /**
     * Get Domain Nameservers
     *
     * @param string $domain
     * @param int $module_row_id
     * @return boolean
     */
    public function getDomainNameServers($domain, $module_row_id = null)
    {
        Base::setModule($this->getModuleRow($module_row_id));
        Base::moduleInstance($this);
        // Get nameservers
        $r = $this->domainManager->getDomainStatus($domain);
        if (!Helper::errorHandler($r)) {
            return [];
        }

        if ($r["CODE"] === "200" && isset($r["PROPERTY"]["NAMESERVER"]) && is_array($r["PROPERTY"]["NAMESERVER"])) {
            $nameservers = [];
            foreach ($r["PROPERTY"]["NAMESERVER"] as $nameserver) {
                // Perform the match
                if (preg_match("/^(\S+)\s+((?:\d{1,3}\.){3}\d{1,3})$/", $nameserver, $matches)) {
                    // Extract nameserver and IP address
                    $nameserver = $matches[1];
                    $ipAddress = $matches[2];
                    $nameservers[] = [
                        "url" => $nameserver,
                        "ips" => [$ipAddress]
                    ];
                } else {
                    $nameservers[] = [
                        "url" => $nameserver
                    ];
                }
            }
            return $nameservers;
        }

        return [];
    }

    /**
     * Handle updating settings
     *
     * @param string $view The view to use
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    private function manageSettings(
        $view,
        $package,
        $service,
        array $get = null,
        array $post = null,
        array $files = null
    ) {
        $this->view = new View($view, "default");
        // Load the helpers required for this view
        Loader::loadHelpers($this, ["Form", "Html"]);

        $vars = new stdClass();

        Base::setModule($this->getModuleRow($package->module_row));
        Base::moduleInstance($this);
        $fields = $this->serviceFieldsToObject($service->fields);

        $tld = trim($this->getTld($fields->domain), ".");
        $sld = trim(substr($fields->domain, 0, -strlen($tld)), ".");

        // Whois privacy settings of a TLD
        $r = $this->domainManager->call([
            "COMMAND" => "QueryDomainList",
            "UNIQUE" => 1,
            "DOMAIN" => $fields->domain,
            "OBJECTCLASS" => "DOMAIN",
            "WIDE" => 1
        ]);

        Helper::errorHandler($r);

        // Display whois_privacy & registrar lock setting for the domain if it is supported
        if ($r["CODE"] === "200") {
            // Registrar lock
            $vars->registrar_lock = (!isset($r["PROPERTY"]["DOMAINTRANSFERLOCK"][0]) || strlen($r["PROPERTY"]["DOMAINTRANSFERLOCK"][0]) === 0) ? "-1" : $r["PROPERTY"]["DOMAINTRANSFERLOCK"][0] === "1";

            // Whois privacy
            $vars->whois_privacy = (!isset($r["PROPERTY"]["X-ACCEPT-WHOISTRUSTEE-TAC"][0]) || strlen($r["PROPERTY"]["X-ACCEPT-WHOISTRUSTEE-TAC"][0]) === 0) ? "-1" : $r["PROPERTY"]["X-ACCEPT-WHOISTRUSTEE-TAC"][0] === "1";
            // check if id_protection is enabled for the domain
            $vars->whois_privacy = !$this->featureServiceEnabled('id_protection', $service) ? "-1" : $vars->whois_privacy;
        }

        // To get epp/auth code
        if (isset($post["request_epp"])) {
            // Expiring Authorization Codes
            // https://confluence.centralnic.com/display/RSR/Expiring+Authcodes
            // pending cases:
            // - RSRBE-3774
            // - RSRBE-3753
            $response = $r; //StatusDomain
            if (preg_match("/\.(eu|be)$/i", $fields->domain)) {
                $response = $this->domainManager->call([
                    "COMMAND" => "RequestDomainAuthInfo",
                    "DOMAIN" => $fields->domain,
                ]);
                // TODO -> PENDING = 1|0
                if ($response["CODE"] === "540") { // .eu
                    // Object exists; The domain name already has a transfer authorisation code
                    $response = $r;
                }
            } elseif (preg_match("/\.de$/i", $fields->domain)) {
                $response = $this->domainManager->call([
                    "COMMAND" => "ModifyDomain",
                    "GENERATERANDOMAUTH" => 1,
                    "TRANSFERLOCK" => 0,
                    "DOMAIN" => $fields->domain
                ]);
            } elseif (preg_match("/\.(nz|fi)$/i", $fields->domain)) {
                $response = $this->domainManager->call([
                    "COMMAND" => "ModifyDomain",
                    "GENERATERANDOMAUTH" => 1,
                    "DOMAIN" => $fields->domain
                ]);
                if ($response["CODE"] === "200") {
                    $response = $this->domainManager->call([
                        "COMMAND" => "StatusDomain",
                        "DOMAIN" => $fields->domain,
                    ]);
                }
            }

            // check response
            if ($response["CODE"] === "200") {
                if (!isset($response["PROPERTY"]["AUTH"][0])) {
                    $this->Input->setErrors([
                        "errors" => ["EPP Code has been send to registrant by email."],
                    ]);
                } elseif (!strlen($response["PROPERTY"]["AUTH"][0])) {
                    $this->Input->setErrors([
                        "errors" => ["No AuthInfo code assigned to this domain name. Contact Support."],
                    ]);
                } else {
                    $vars->{"auth"} = $response["PROPERTY"]["AUTH"][0];
                }
            } else {
                $this->Input->setErrors([
                    "errors" => ["Failed loading the epp code (" . $response["error"] . ")."],
                ]);
            }
        }

        // Save transferlock settings of a domain
        if ((isset($post["registrar_lock"]) || isset($post["whois_privacy"])) && !isset($post["request_epp"])) {
            $command = [
                "COMMAND" => "ModifyDomain",
                "DOMAIN" => $fields->domain
            ];

            if ($vars->whois_privacy !== "-1" && isset($post["whois_privacy"])) {
                $command["X-ACCEPT-WHOISTRUSTEE-TAC"] = $post["whois_privacy"] === "on" ? "1" : "0";
                $vars->whois_privacy = $post["whois_privacy"] === "on";
            }

            if ($vars->registrar_lock !== "-1" && isset($post["registrar_lock"])) {
                $command["TRANSFERLOCK"] = $post["registrar_lock"] === "on" ? "1" : "0";
                $vars->registrar_lock = $post["registrar_lock"] === "on";
            }

            $this->domainManager->call($command);
        }

        $this->view->set("vars", $vars);
        $this->view->setDefaultView(self::$defaultModuleView);
        return $this->view->fetch();
    }

    /**
     * Performs a whois lookup on the given domain
     *
     * @param string $domain The domain to lookup
     * @param int $module_row_id The ID of the module row to fetch for the current module
     * @return bool True if available, false otherwise
     */
    public function checkAvailability($domain, $module_row_id = null)
    {
        $row = $this->getModuleRow($module_row_id);
        Base::setModule($row);
        Base::moduleInstance($this);

        $r = $this->domainManager->call([
            "COMMAND" => "CheckDomains",
            "DOMAIN0" => $domain,
            "PREMIUMCHANNELS" => "*",
        ]);

        if ($r["CODE"] !== "200") {
            $this->Input->setErrors([
                "errors" => [$domain . ": " . $r["DESCRIPTION"]],
            ]);
            return false;
        }
        if (empty($r["PROPERTY"]["DOMAINCHECK"][0])) {
            return false;
        }

        $fulldc = $r["PROPERTY"]["DOMAINCHECK"][0];
        $dc = substr($fulldc, 0, 3);
        if ($dc === "210") { //AVAILABLE
            return true;
        }

        $error = false;
        if ($dc === "549") {
            $error = $domain . ": Unsupported TLD or availability lookup failed";
        } elseif ($dc === "211") {
            if (preg_match("/block/", $r["PROPERTY"]["REASON"][0])) { // CASE: DOMAIN BLOCK
                //$error = $domain . ": Reserved Domain (Domain Block).";
            } elseif (preg_match("/^Collision Domain name available \{/i", substr($fulldc, 3))) { // CASE: NXD DOMAIN
                //$error = $domain . ": Reserved Domain (Collision Domain).";
            } elseif (!empty($r["PROPERTY"]["PREMIUMCHANNEL"][0])) { // CASE: PREMIUM
                $this->Input->setErrors([
                    "errors" => [$domain . ": Premium Domain. Contact Support."],
                ]);
            } elseif (
                !empty($r["PROPERTY"]["CLASS"][0]) // CASE: RESERVED or PREMIUM? BACKORDER
                && stripos($r["PROPERTY"]["REASON"][0], "reserved") //RESERVED
            ) {
                $this->Input->setErrors([
                    "errors" => [$domain . ": Reserved Domain. Contact Support."],
                ]);
            }
        }
        return false;
    }

    /**
     * Gets the domain expiration date
     *
     * @param stdClass $service The service belonging to the domain to lookup
     * @param string $format The format to return the expiration date in
     * @return string The domain expiration date in UTC time in the given format
     * @see Services::get()
     */
    public function getExpirationDate($service, $format = "Y-m-d H:i:s")
    {
        Loader::loadHelpers($this, ["Date"]);

        $domain = $this->getServiceDomain($service);

        Base::setModule($this->getModuleRow($service->module_row_id ?? null));
        Base::moduleInstance($this);

        $r = $this->domainManager->call([
            "COMMAND" => "StatusDomain",
            "DOMAIN" => $domain,
        ]);

        if ($r["CODE"] !== "200") { //TODO expired cases
            return false;
        }

        // cast our UTC API timestamp format to useful formats in local timezone
        $expirationdate = $this->_castDate($r["PROPERTY"]["EXPIRATIONDATE"][0], $format);
        $finalizationdate = $this->_castDate($r["PROPERTY"]["FINALIZATIONDATE"][0], $format);
        $paiduntildate = $this->_castDate($r["PROPERTY"]["PAIDUNTILDATE"][0], $format);
        $failuredate = $this->_castDate($r["PROPERTY"]["FAILUREDATE"][0], $format);

        if ($failuredate["ts"] > $paiduntildate["ts"]) {
            $expirydate = $paiduntildate["ts"];
        } else {
            $expirydate = $finalizationdate["ts"] + ($paiduntildate["ts"] - $expirationdate["ts"]);
            //$expirydate = gmdate($format, $ts);
        }

        return $this->Date->format($format, $expirydate);
    }

    /**
     * Gets the domain registration date
     *
     * @param stdClass $service The service belonging to the domain to lookup
     * @param string $format The format to return the registration date in
     * @return string The domain registration date in UTC time in the given format
     * @see Services::get()
     */
    public function getRegistrationDate($service, $format = 'Y-m-d H:i:s')
    {
        Loader::loadHelpers($this, ["Date"]);

        $domain = $this->getServiceDomain($service);

        Base::setModule($this->getModuleRow($service->module_row_id ?? null));
        Base::moduleInstance($this);

        $r = $this->domainManager->call([
            "COMMAND" => "QueryDomainList",
            "DOMAIN" => $domain,
        ]);

        if ($r["CODE"] !== "200") {
            return false;
        }

        // cast our UTC API timestamp format to useful formats in local timezone
        $createdDate = $this->_castDate($r["PROPERTY"]["CREATEDDATE"][0], $format);
        return $this->Date->format($format, $createdDate);
    }

    /**
     * Gets the domain name from the given service
     *
     * @param stdClass $service The service from which to extract the domain name
     * @return string The domain name associated with the service
     */
    public function getServiceDomain($service)
    {
        if (isset($service->fields)) {
            foreach ($service->fields as $service_field) {
                if ($service_field->key === "domain") {
                    return $service_field->value;
                }
            }
        }

        return $this->getServiceName($service);
    }

    /**
     * Get a list of the TLDs supported by the registrar module
     *
     * @param int $module_row_id The ID of the module row to fetch for the current module
     * @return array A list of all TLDs supported by the registrar module
     */
    public function getTlds($module_row_id = null)
    {
        $row = $this->getModuleRow($module_row_id);
        $row = !empty($row) ? $row : $this->getModuleRows()[0];
        if (empty($row)) {
            return [];
        }

        Base::setModule($row);
        Base::moduleInstance($this);
        // Fetch the TLDs results from the cache, if they exist
        $cache = Cache::fetchCache(
            "tlds",
            Configure::get("Blesta.company_id") . DS . "modules" . DS . "ispapi" . DS
        );
        if ($cache) {
            return unserialize(base64_decode($cache));
        }

        // Fetch ispapi TLDs
        $r = $this->domainManager->call([
            "COMMAND" => "StatusUser",
            "PROPERTIES" => "TLDDATA"
        ]);

        // Handling api errors
        if ($r["CODE"] !== "200") {
            return [];
        }

        $tldclassmap = [];
        $convertIdnTlds = [];
        if (!empty($r["PROPERTY"]["TLDCLASS"]) && !empty($r["PROPERTY"]["TLDLABEL"])) {
            foreach ($r["PROPERTY"]["TLDCLASS"] as $tldKey => $tldClass) {
                if (empty($tldClass)) {
                    continue;
                }
                $tldLabel = $r["PROPERTY"]["TLDLABEL"][$tldKey];
                if (strpos($tldLabel, "(") !== false) {
                    continue;
                }
                $tldLabel = !empty($tldLabel) ? $tldLabel : "."  . strtolower($tldClass);
                if (preg_match("/^XN--/", $tldClass)) {
                    $convertIdnTlds[$tldClass] = true;
                } elseif (!empty($tldClass) && !isset($tldclassmap[$tldClass])) {
                    $tldclassmap[$tldClass] = $tldLabel;
                }
            }
        }

        if (!empty($convertIdnTlds)) {
            $idnKeys = array_keys($convertIdnTlds);

            $rconv = $this->domainManager->call([
                "COMMAND" => "ConvertIDN",
                "DOMAIN" => $idnKeys
            ]);

            if ($rconv["CODE"] === "200") {
                foreach ($idnKeys as $idnIndex => $idnSubClass) {
                    $tldclassmap[$idnSubClass] = "." . $rconv["PROPERTY"]["IDN"][$idnIndex];
                }
            }
        }

        $tlds = [];
        foreach ($r["PROPERTY"]["RELATIONTYPE"] as $idx => $t) {
            if (preg_match("/^PRICE_CLASS_(MANAGED)?DOMAIN_([^_]+)_(SETUP|CREATE)$/", $t, $m)) {
                // block relation just leads to not getting the relation returned
                $tldclass = $m[2];
                if (isset($tldclassmap[$tldclass])) {
                    $tlds[] = $tldclassmap[$tldclass];
                }
                // else | otherwise skip that tldclass
            }
        }

        // cleanup and sort list of tlds
        $tlds = array_values(array_unique($tlds));
        usort($tlds, function ($tld1, $tld2) {
            $a = implode(".", array_reverse(explode(".", $tld1))); //com, uk.co
            $b = implode(".", array_reverse(explode(".", $tld2))); //ca, de.com
            if ($a === $b) {
                return 0;
            }
            return ($a > $b) ? 1 : -1;
        });

        // Save the TLDs results to the cache
        if (count($tlds) > 0) {
            if (Configure::get("Caching.on") && is_writable(CACHEDIR)) {
                try {
                    Cache::writeCache(
                        "tlds",
                        base64_encode(serialize($tlds)),
                        strtotime(Configure::get("Blesta.cache_length")) - time(),
                        Configure::get("Blesta.company_id") . DS . "modules" . DS . "ispapi" . DS
                    );
                } catch (Exception $e) {
                    // Write to cache failed, so disable caching
                    Configure::set("Caching.on", false);
                }
            }
        }

        return $tlds;
    }

    /**
     * Returns all tabs to display to an admin when managing a service
     *
     * @param stdClass $service A stdClass object representing the service
     * @return array An array of tabs in the format of method => title.
     *  Example: ["methodName" => "Title", "methodName2" => "Title2"]
     */
    public function getAdminServiceTabs($service)
    {
        Loader::loadModels($this, ["Packages"]);

        $package = $this->Packages->get($service->package_id ?? $service->package->id);

        if ($package->meta->type == "domain") {
            $tabs = [
                "tabWhois" => Language::_("Ispapi.tab_whois.title", true),
                "tabEmailForwarding" => Language::_("Ispapi.tab_email_forwarding", true),
                "tabNameservers" => Language::_("Ispapi.tab_nameservers.title", true),
                "tabPrivateNameservers" => Language::_("Ispapi.tab_private_nameservers.title", true),
                "tabDnsRecords" => Language::_("Ispapi.tab_dnsrecord.title", true),
                'tabDnssec' => Language::_('Ispapi.tab_dnssec.title', true),
                "tabSettings" => Language::_("Ispapi.tab_settings.title", true),
            ];

            // Check if DNS Management is enabled
            if (!$this->featureServiceEnabled("dns_management", $service)) {
                unset($tabs["tabDnsRecords"]);
            }

            // Check if Email Forwarding is enabled
            if (!$this->featureServiceEnabled("email_forwarding", $service)) {
                unset($tabs["tabEmailForwarding"]);
            }

            // Check if DNSSEC is enabled
            if (!$this->featureServiceEnabled("dnssec", $service)) {
                unset($tabs["tabDnssec"]);
            }
            return $tabs;
        }
    }

    /**
     * Admin DNS Records tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabDnsRecords($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->manageDnsRecords("tab_dnsrecords", $package, $service, $get, $post, $files);
    }

    /**
     * Admin Email Forwarding tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabEmailForwarding($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->manageEmailForwarding('tab_email_forwarding', $package, $service, $get, $post, $files);
    }

    /**
     * Client Email Forwarding tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function tabClientEmailForwarding($package, $service, array $get = null, array $post = null, array $files = null)
    {
        return $this->manageEmailForwarding('tab_client_email_forwarding', $package, $service, $get, $post, $files);
    }

    /**
     * Email Forwarding client tab
     *
     * @param stdClass $package A stdClass object representing the current package
     * @param stdClass $service A stdClass object representing the current service
     * @param array $get Any GET parameters
     * @param array $post Any POST parameters
     * @param array $files Any FILES parameters
     * @return string The string representing the contents of this tab
     */
    public function manageEmailForwarding(
        $view,
        $package,
        $service,
        $get,
        $post,
        $files
    ) {
        $vars = new stdClass();

        // if the domain is pending transfer display a notice of such
        $checkDomainStatus = $this->checkDomainStatus($service, $package);
        if (isset($checkDomainStatus)) {
            return $checkDomainStatus;
        }

        $this->view = new View($view, 'default');
        Base::setModule($this->getModuleRow($package->module_row));
        Base::moduleInstance($this);

        // Load the helpers required for this view
        Loader::loadHelpers($this, ['Form', 'Html']);

        $fields = $this->serviceFieldsToObject($service->fields);

        if (!empty($post)) {
            // Delete email forwarder
            if (!empty($post['delete'])) {
                $response = $this->domainManager->saveEmailForwardingRR($fields->domain, $post, "DELETE");
            } else {
                $response = $this->domainManager->saveEmailForwardingRR($fields->domain, $post);
            }

            Helper::errorHandler($response);

            $vars = (object) $post;
        }

        // Get email forwarders
        $response = $this->domainManager->getEmailForwardingRR($fields->domain);

        if (!isset($response["CODE"]) || $response["CODE"] === "545") {
            $createDNS = $this->domainManager->createDNSZone($fields->domain);
            Helper::errorHandler($createDNS);

            if (isset($createDNS["CODE"]) && $createDNS["CODE"] !== "200") {
                $this->view->set("dnszone_unsupported", true);
                Helper::errorHandler($response);
            }
        } else {
            Helper::errorHandler($response);
        }

        if (isset($response["resources"])) {
            $vars->addresses = $response["resources"];
        }

        $this->view->set('vars', $vars);
        $this->view->set('domain', $fields->domain);
        $this->view->setDefaultView(self::$defaultModuleView);

        return $this->view->fetch();
    }

    /**
     * Checks if a feature is enabled for a given service
     *
     * @param string $feature The name of the feature to check if it's enabled (e.g. id_protection)
     * @param stdClass $service An object representing the service
     * @return bool True if the feature is enabled, false otherwise
     */
    private function featureServiceEnabled($feature, $service)
    {
        if ($feature === "dnssec") {
            $row = $this->getModuleRow($service->module_row_id);
            if ($row->meta->dnssec === 'true') {
                return true;
            }
        }

        // Get service option groups
        foreach ($service->options as $option) {
            if ($option->option_name == $feature) {
                return true;
            }
        }

        return false;
    }

    /**
     * Retrieves the domain status view
     *
     * @param stdClass $service An stdClass object representing the service
     * @param stdClass $package An stdClass object representing the package
     * @return null|string The domain status view if available, otherwise void
     */
    private function checkDomainStatus($service, $package)
    {
        // hello
    }


    /**
     * Handle updating host information
     *
     * @param string $view The name of the view to fetch
     * @param stdClass $package An stdClass object representing the package
     * @param stdClass $service An stdClass object representing the service
     * @param array $get Any GET arguments (optional)
     * @param array $post Any POST arguments (optional)
     * @param array $files Any FILES data (optional)
     * @return string The rendered view
     */
    private function manageDnssec($view, $package, $service, array $get = null, array $post = null, array $files = null)
    {
        $vars = new stdClass();

        // if the domain is pending transfer display a notice of such
        $checkDomainStatus = $this->checkDomainStatus($service, $package);
        if (isset($checkDomainStatus)) {
            return $checkDomainStatus;
        }

        $this->view = new View($view, 'default');
        $this->view->base_uri = $this->base_uri;
        // Load the helpers required for this view
        Loader::loadHelpers($this, ['Form', 'Html']);
        $fields = $this->serviceFieldsToObject($service->fields);

        Base::setModule($this->getModuleRow($package->module_row));
        Base::moduleInstance($this);

        if (!empty($post)) {
            $action = $post['action'] ?? false;
            if ($action) {
                switch ($action) {
                    case 'addDsDnssec':
                        $response = $this->domainManager->addDnssecRecord($fields->domain, $post);
                        break;
                    case 'deleteDsDnssec':
                        $response = $this->domainManager->deleteDnssecRecord($fields->domain, $post);
                        break;
                    case 'addKeyDnssec':
                        $response = $this->domainManager->addDnssecRecord($fields->domain, $post, "KEY");
                        break;
                    case 'deleteKeyDnssec':
                        $response = $this->domainManager->deleteDnssecRecord($fields->domain, $post, "KEY");
                        break;
                }
                Helper::errorHandler($response);
            }
        }

        $domainRepoInfo = $this->domainManager->getDomainRepositoryInfo($fields->domain);
        Helper::errorHandler($domainRepoInfo);

        $supports_ds_data = isset($domainRepoInfo["PROPERTY"]["ZONESECDNSINTERFACE"][0]) && $domainRepoInfo["PROPERTY"]["ZONESECDNSINTERFACE"][0] === "DS";

        $secdnsds_formatted = [];
        $secdnskey_formatted = [];
        if ($supports_ds_data) {
            $response = $this->domainManager->getDomainStatus($fields->domain);
            Helper::errorHandler($response);

            if ($response["CODE"] === "200") {
                $secdnsds = (isset($response["PROPERTY"]["SECDNS-DS"])) ? $response["PROPERTY"]["SECDNS-DS"] : [];
                //delete empty KEY records, if cb fn not provided, array_filter will remove empty entries
                $secdnskey = (isset($response["PROPERTY"]["SECDNS-KEY"])) ? array_values(array_filter($response["PROPERTY"]["SECDNS-KEY"])) : [];

                //split in different fields
                foreach ($secdnskey as $key) {
                    list($flags, $protocol, $algorithm, $public_key) = preg_split("/\s+/", $key);
                    $secdnskey_formatted[] = [
                        "flags" => $flags,
                        "protocol" => $protocol,
                        "algorithm" => $algorithm,
                        "public_key" => $public_key
                    ];
                }

                //split in different fields
                foreach ($secdnsds as $ds) {
                    list($keytag, $alg, $digesttype, $digest) = preg_split("/\s+/", $ds);
                    $secdnsds_formatted[] = [
                        "key_tag" => $keytag,
                        "algorithm" => $alg,
                        "digest_type" => $digesttype,
                        "digest" => $digest
                    ];
                }
            }
        }

        $vars->selects = Configure::get('Ispapi.dnssec');
        $vars->ds_records = $secdnsds_formatted;
        $vars->key_records = $secdnskey_formatted;

        $this->view->set('vars', $vars);
        $this->view->set('client_id', $service->client_id);
        $this->view->set('service_id', $service->id);
        $this->view->set('domain', $fields->domain);
        $this->view->set('supports_ds_data', $supports_ds_data);
        $this->view->set('supports_key_data', !$supports_ds_data);
        $this->view->setDefaultView(self::$defaultModuleView);

        return $this->view->fetch();
    }

    /**
     * Handle updating DNS Record information
     *
     * @param string $view The name of the view to fetch
     * @param stdClass $package An stdClass object representing the package
     * @param stdClass $service An stdClass object representing the service
     * @param array $get Any GET arguments (optional)
     * @param array $post Any POST arguments (optional)
     * @param array $files Any FILES data (optional)
     * @return string The rendered view
     */
    private function manageDnsRecords(
        $view,
        $package,
        $service,
        array $get = null,
        array $post = null,
        array $files = null
    ) {
        $vars = new stdClass();
        Base::setModule($this->getModuleRow($package->module_row));
        Base::moduleInstance($this);
        // if the domain is pending transfer display a notice of such
        $checkDomainStatus = $this->checkDomainStatus($service, $package);
        if (isset($checkDomainStatus)) {
            return $checkDomainStatus;
        }

        $this->view = new View($view, "default");
        $this->view->base_uri = $this->base_uri;

        // Load the helpers required for this view
        Loader::loadHelpers($this, ["Form", "Html"]);

        $fields = $this->serviceFieldsToObject($service->fields);
        $this->view->set("domain", $fields->domain);
        if (!empty($post) && isset($post["action"])) {
            $action = $post["action"];

            switch ($action) {
                case "addDnsRecord":
                    $response = $this->domainManager->addDNS($fields->domain, $post);
                    break;
                case "deleteDnsRecord":
                    $response = $this->domainManager->deleteDNS($fields->domain, $post);
                    break;
            }

            Helper::errorHandler($response);
        }

        // Load list of Resource Records
        $response = $this->domainManager->getDNSZoneRRList($fields->domain);

        if (!isset($response["CODE"]) || $response["CODE"] === "545") {
            $createDNS = $this->domainManager->createDNSZone($fields->domain);
            Helper::errorHandler($createDNS);

            if (isset($createDNS["CODE"]) && $createDNS["CODE"] !== "200") {
                $this->view->set("dnszone_unsupported", true);
                Helper::errorHandler($response);
            }
        } else {
            Helper::errorHandler($response);
        }

        $vars->selects = array_combine(Helper::getSupportedRRTypes(), array_values(Helper::getSupportedRRTypes())); // make keys and values same
        $vars->records = Helper::getResourceRecords($response["PROPERTY"]["RR"] ?? []);

        $this->view->set("vars", $vars);
        $this->view->set("client_id", $service->client_id);
        $this->view->set("service_id", $service->id);
        $this->view->setDefaultView(self::$defaultModuleView);

        return $this->view->fetch();
    }


    /**
     * Handle updating host information
     *
     * @param string $view The name of the view to fetch
     * @param stdClass $package An stdClass object representing the package
     * @param stdClass $service An stdClass object representing the service
     * @param array $get Any GET arguments (optional)
     * @param array $post Any POST arguments (optional)
     * @param array $files Any FILES data (optional)
     * @return string The rendered view
     */
    private function managePrivateNameServers($view, $package, $service, array $get = null, array $post = null, array $files = null)
    {
        $vars = new stdClass();

        // if the domain is pending transfer display a notice of such
        $checkDomainStatus = $this->checkDomainStatus($service, $package);
        if (isset($checkDomainStatus)) {
            return $checkDomainStatus;
        }

        $this->view = new View($view, 'default');
        $this->view->base_uri = $this->base_uri;
        // Load the helpers required for this view
        Loader::loadHelpers($this, ['Form', 'Html']);

        Base::setModule($this->getModuleRow($package->module_row));
        Base::moduleInstance($this);

        $fields = $this->serviceFieldsToObject($service->fields);

        if (!empty($post)) {
            // if all of the ips are blanked, lets remove the host
            if (isset($post['delete_nameserver']) && !empty($post['delete_nameserver']) && empty($post['new_nameserver']) && empty($post['new_nameserver_ip'])) {
                $response = $this->domainManager->deleteNameserver($post['delete_nameserver']);
            }

            if (isset($post['new_nameserver']) && isset($post['new_nameserver_ip']) && !empty($post['new_nameserver']) && !empty($post['new_nameserver_ip'])) {
                $response = $this->domainManager->registerNameserver($fields->domain, $post);
            }

            Helper::errorHandler($response);

            $vars = (object) $post;
        }

        $response = $this->domainManager->getDomainStatus($fields->domain);
        Helper::errorHandler($response);
        $vars->hosts = [];
        foreach ($response["PROPERTY"]["HOST"] as $hostInfo) {
            // Split the host information into hostname and IP address
            $hostComponents = explode(" ", $hostInfo);
            $hostname = explode(".", $hostComponents[0])[0]; // Extract hostname from the first part
            $ip = $hostComponents[1]; // Extract IP address from the second part

            // Add host information to the array of hosts
            $vars->hosts[] = ["hostname" => $hostname, "ip" => $ip];
        }

        $this->view->set('vars', $vars);
        $this->view->set('domain', $fields->domain);
        $this->view->set('client_id', $service->client_id);
        $this->view->set('service_id', $service->id);
        $this->view->setDefaultView(self::$defaultModuleView);

        return $this->view->fetch();
    }

    /**
     * Validates that the given connection details
     *
     * @param string $key The API key
     * @param string $user The API user
     * @param string $sandbox "true" if this is a sandbox account, false otherwise
     * @return bool True if the connection details are valid, false otherwise
     */
    public function validateConnection($key, $user, $sandbox, $dnssec, $module_row_id)
    {
        $row = json_decode(json_encode([
            "module_id" => $module_row_id ?? null,
            "meta" => [
                "user" => $user,
                "key" => $key,
                "sandbox" => $sandbox,
                "dnssec" => $dnssec,
            ],
        ]));

        Base::setModule($row);
        Base::moduleInstance($this);
        $r = $this->domainManager->call([
            "COMMAND" => "CheckAuthentication",
            "SUBUSER" => $user,
            "PASSWORD" => $key
        ]);

        Helper::errorHandler($r);
        // Workarround to call that only 1 time.
        static $included = false;

        if (!$included) {
            $included = true;

            $values = [
                "blesta" => BLESTA_VERSION,
                "updated_date" => gmdate("Y-m-d H:i:s"),
                "ispapi_version" => $this->getVersion(),
                "php_version" => implode(".", [PHP_MAJOR_VERSION, PHP_MINOR_VERSION, PHP_RELEASE_VERSION]),
                "os" => php_uname("s"),
                // TODO pf
            ];

            $command = [
                "COMMAND" => "SetEnvironment",
            ];
            $i = 0;
            $envkey = "middleware/blesta/" . $_SERVER["HTTP_HOST"];
            foreach ($values as $key => $value) {
                $command["ENVIRONMENTKEY$i"] = $envkey;
                $command["ENVIRONMENTNAME$i"] = $key;
                $command["ENVIRONMENTVALUE$i"] = $value;
                $i++;
            }
            $this->domainManager->call($command);
        }

        return "OK";
    }

    /**
     * Returns the TLD of the given domain
     *
     * @param string $domain The domain to return the TLD from
     * @return string The TLD of the domain
     */
    private function getTld($domain)
    {
        $tlds = $this->getTlds();
        $domain = strtolower($domain);

        foreach ($tlds as $tld) {
            if (substr($domain, -strlen($tld)) === $tld) {
                return $tld;
            }
        }

        return strstr($domain, ".");
    }

    /**
     * Formats a phone number into +NNN.NNNNNNNNNN
     *
     * @param string $number The phone number
     * @param string $country The ISO 3166-1 alpha2 country code
     * @return string The number in +NNN.NNNNNNNNNN
     */
    private function formatPhone($number, $country)
    {
        if (!isset($this->Contacts)) {
            Loader::loadModels($this, ["Contacts"]);
        }

        return $this->Contacts->intlNumber($number, $country, ".");
    }

    //TODO install, upgrade, uninstall, cron
    //cron to be used to sync expiration date?

    /**
     * Sends an email to the debug address with the given data
     *
     * @param mixed $data The data to send
     */
    public function debug($data)
    {
        file_put_contents("/tmp/dump.txt", var_export($data, true));
    }
}
