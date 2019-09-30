<?php
/**
 * Ispapi Module
 *
 * @package blesta
 * @subpackage blesta.components.modules.ispapi
 * @copyright Copyright (c) 2018, Phillips Data, Inc.
 * @license http://www.blesta.com/license/ The Blesta License Agreement
 * @link http://www.blesta.com/ Blesta
 */
class Ispapi extends Module
{
    /**
     * @var string The version of this module
     */
    private static $version = "1.2.2";

    /**
     * @var string The authors of this module
     */
    private static $authors = [
        [
            'name'=> 'HEXONET GmbH',
            'url'=>'http://www.hexonet.net/'
        ],
        [
            #'name'=> 'The Official ISPAPI Registrar Module',
            'name'=> '',
            'url'=>'http://www.hexonet.net/'
        ]
    ];

    /**
     * Initializes the module
     */
    public function __construct()
    {
        // Load components required by this module
        Loader::loadComponents($this, ['Input']);

        // Load the language required by this module
        Language::loadLang('ispapi', null, dirname(__FILE__) . DS . 'language' . DS);

        Configure::load('ispapi', dirname(__FILE__) . DS . 'config' . DS);
    }

    /**
     * Returns the name of this module
     *
     * @return string The common name of this module
     */
    public function getName()
    {
        return Language::_('Ispapi.name', true);
    }

    /**
     * Returns the version of this module
     *
     * @return string The current version of this module
     */
    public function getVersion()
    {
        return self::$version;
    }

    /**
     * Returns the name and URL for the authors of this module
     *
     * @return array A numerically indexed array that contains an array with
     *  key/value pairs for 'name' and 'url', representing the name and URL of the authors of this module
     */
    public function getAuthors()
    {
        return self::$authors;
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
            if ($field->key == 'domain') {
                return $field->value;
            }
        }
        return null;
    }

    /**
     * Returns a noun used to refer to a module row (e.g. "Server", "VPS", "Reseller Account", etc.)
     *
     * @return string The noun used to refer to a module row
     */
    public function moduleRowName()
    {
        // In this module it is 'Account'
        return Language::_('Ispapi.module_row', true);
    }

    /**
     * Returns a noun used to refer to a module group (e.g. "Server Group", "Cloud", etc.)
     *
     * @return string The noun used to refer to a module group
     */
    public function moduleGroupName()
    {
        return null;
    }

    /**
     * Returns the key used to identify the primary field from the set of module row meta fields.
     * This value can be any of the module row meta fields.
     *
     * @return string The key used to identify the primary field from the set of module row meta fields
     */
    public function moduleRowMetaKey()
    {
        return 'user';
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
        if (isset($vars['domain'])) {
            return $vars['domain'];
        }
        return null;
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
        $status = 'pending'
    ) {
        // 'Service' meaning here registered or tranferred domain name
        $row = $this->getModuleRow($package->module_row);
        $api = $this->getApi($row->meta->user, $row->meta->key, $row->meta->sandbox == 'true');

        $whois_sections = Configure::get('Ispapi.whois_sections');

        $tld = null;
        $input_fields = [];

        if (isset($vars['domain'])) {
            $tld = $this->getTld($vars['domain']);
        }
        
        $input_fields = array_merge(
            Configure::get("Ispapi.domain_fields"),
            (array) Configure::get("Ispapi.domain_fields" . $tld),
            (array) Configure::get("Ispapi.nameserver_fields"),
            (array) Configure::get("Ispapi.transfer_fields"),
            array('NumYears' => true, 'transfer' => isset($vars['transfer']) ? $vars['transfer'] : 1)
        );
        
        $all = new IspapiAll($api);

        if (isset($vars['use_module']) && $vars['use_module'] == 'true') {
            if ($package->meta->type == 'domain') {
                $vars['NumYears'] = 1;
                $vars['SLD'] = substr($vars['domain'], 0, -strlen($tld));
                $vars['TLD'] = ltrim($tld, '.');

                foreach ($package->pricing as $pricing) {
                    if ($pricing->id == $vars['pricing_id']) {
                        $vars['NumYears'] = $pricing->term;
                        $vars['Period'] = $pricing->period;
                        break;
                    }
                }

                // Fields for contact information
                $whois_fields = Configure::get('Ispapi.whois_fields');

                // Contact information of a customer
                if (!isset($this->Clients)) {
                    Loader::loadModels($this, ['Clients']);
                }
                if (!isset($this->Contacts)) {
                    Loader::loadModels($this, ['Contacts']);
                }

                $client = $this->Clients->get($vars['client_id']);

                if ($client) {
                    $numbers = $this->Contacts->getNumbers($client->contact_id, 'phone');
                }

                // Customer contact information according to whois_fields = Registrant, Admin, Tech and Billing
                foreach ($whois_fields as $key => $value) {
                    if (strpos($key, 'FirstName') !== false) {
                        $vars[$key] = $client->first_name;
                    } elseif (strpos($key, 'LastName') !== false) {
                        $vars[$key] = $client->last_name;
                    } elseif (strpos($key, 'Organization') !== false) {
                        $vars[$key] = $client->company;
                    } elseif (strpos($key, 'Address1') !== false) {
                        $vars[$key] = $client->address1;
                    } elseif (strpos($key, 'Address2') !== false) {
                        $vars[$key] = $client->address2;
                    } elseif (strpos($key, 'City') !== false) {
                        $vars[$key] = $client->city;
                    } elseif (strpos($key, 'StateProvince') !== false) {
                        $vars[$key] = $client->state;
                    } elseif (strpos($key, 'PostalCode') !== false) {
                        $vars[$key] = $client->zip;
                    } elseif (strpos($key, 'Country') !== false) {
                        $vars[$key] = $client->country;
                    } elseif (strpos($key, 'Phone') !== false) {
                        $vars[$key] = $this->formatPhone(
                            isset($numbers[0]) ? $numbers[0]->number : null,
                            $client->country
                        );
                    } elseif (strpos($key, 'EmailAddress') !== false) {
                        $vars[$key] = $client->email;
                    }
                }

                // Nameservers
                $vars['UseDNS'] = 'default';
                for ($i=1; $i<=5; $i++) {
                    if (!isset($vars['ns' . $i]) || $vars['ns' . $i] == '') {
                        unset($vars['ns' . $i]);
                    } else {
                        unset($vars['UseDNS']);
                    }
                }
                $fields = array_intersect_key($vars, $input_fields);

                // Registrant, Admin, Tech and Billing contact information for AddDomain and TransferDomain commands
                foreach ($whois_sections as $key => $contact) {
                    $contact_data[$contact] = array(
                        "FIRSTNAME" => $vars[$contact."FirstName"],
                        "LASTNAME" => $vars[$contact."LastName"],
                        "STREET" => $vars[$contact."Address1"],
                        "ORGANIZATION" => $vars[$contact."Organization"],
                        "CITY" => $vars[$contact."City"],
                        "STATE" => $vars[$contact."StateProvince"],
                        "ZIP" => $vars[$contact."PostalCode"],
                        "COUNTRY" => $vars[$contact."Country"],
                        "PHONE" => $vars[$contact."Phone"],
                        "EMAIL" => $vars[$contact."EmailAddress"]
                    );
                    if (strlen($vars[$contact."Address2"])) {
                        $contact_data[$contact]["STREET"] .= " , ".$vars[$contact."Address2"];
                    }
                }
               
                if (isset($vars['transfer_key']) && !empty($vars['transfer_key'])) {
                    // Handle transfer
                    $command = array(
                        "COMMAND" => "TransferDomain",
                        "DOMAIN" => $vars['domain'],
                        "PERIOD" => $vars['NumYears'],
                        "NAMESERVER0" => $vars["ns1"],
                        "NAMESERVER1" => $vars["ns2"],
                        "NAMESERVER2" => $vars["ns3"],
                        "NAMESERVER3" => $vars["ns4"],
                        "OWNERCONTACT0" => $contact_data['Registrant'],
                        "ADMINCONTACT0" => $contact_data['Admin'],
                        "TECHCONTACT0" => $contact_data['Tech'],
                        "BILLINGCONTACT0" => $contact_data['Billing'],
                        "AUTH" => $vars['transfer_key']
                    );
                    
                    //don't send owner admin tech billing contact for .NU .DK .CA, .US, .PT, .NO, .SE, .ES domains
                    if (preg_match('/[.](nu|dk|ca|us|pt|no|se|es)$/i', $vars['domain'])) {
                        unset($command["OWNERCONTACT0"]);
                        unset($command["ADMINCONTACT0"]);
                        unset($command["TECHCONTACT0"]);
                        unset($command["BILLINGCONTACT0"]);
                    }

                    //don't send owner billing contact for .FR domains
                    if (preg_match('/[.]fr$/i', $vars['domain'])) {
                        unset($command["OWNERCONTACT0"]);
                        unset($command["BILLINGCONTACT0"]);
                    }

                    //send PERIOD=0 for .NO and .NU domains
                    if (preg_match('/[.](no|nu|es)$/i', $vars['domain'])) {
                        $command["PERIOD"] = 0;
                    }
                    
                    //do not send contact information for gTLD (Including nTLDs)
                    if (preg_match('/\.[a-z]{3,}$/i', $vars['domain'])) {
                        unset($command["OWNERCONTACT0"]);
                        unset($command["ADMINCONTACT0"]);
                        unset($command["TECHCONTACT0"]);
                        unset($command["BILLINGCONTACT0"]);
                    }

                    $response = $all->ispapiCall($command);

                    // User transfer support
                    if (preg_match('/USERTRANSFER/', $response->response()["DESCRIPTION"])) {
                        $command["ACTION"] = "USERTRANSFER";
                        $response = $all->ispapiCall($command);
                    }

                    // Handling api errors
                    $this->processResponse($api, $response);

                    if ($this->Input->errors()) {
                        return;
                    }

                    return [['key' => 'domain', 'value' => $fields['domain'], 'encrypted' => 0]];
                } else {
                    // Handle registration
                    $command = array(
                        "COMMAND" => "AddDomain",
                        "DOMAIN" => $vars['domain'],
                        "PERIOD" => $vars['NumYears'],
                        "NAMESERVER0" => $vars["ns1"],
                        "NAMESERVER1" => $vars["ns2"],
                        "NAMESERVER2" => $vars["ns3"],
                        "NAMESERVER3" => $vars["ns4"],
                        "OWNERCONTACT0" => $contact_data['Registrant'],
                        "ADMINCONTACT0" => $contact_data['Admin'],
                        "TECHCONTACT0" => $contact_data['Tech'],
                        "BILLINGCONTACT0" => $contact_data['Billing']
                    );

                    // Not all TLDs additional fields are like X-<tld>-<something>
                    #$tld_pattern = preg_replace('/\./', ' ', strtoupper($tld));
                    #foreach($vars as $key => $value) {
                    #    if (preg_match('/X-'.trim($tld_pattern).'/',$key)){
                    #        $command[$key] = $value;
                    #    }
                    #}
                    // Considered only 'X-<something>' pattern for all fields
                    foreach ($vars as $key => $value) {
                        if (preg_match('/X-(.*)/', $key)) {
                            $command[$key] = $value;
                        }
                    }
                    $response = $all->ispapiCall($command);
                    // Handle api errors
                    $this->processResponse($api, $response);

                    if ($this->Input->errors()) {
                        return;
                    }
                    
                    // Return domain details when registered successfully
                    return [['key' => 'domain', 'value' => $vars['domain'], 'encrypted' => 0]];
                }
            }
        }

        $meta = [];
        $fields = array_intersect_key($vars, $input_fields);
        foreach ($fields as $key => $value) {
            $meta[] = [
                'key' => $key,
                'value' => $value,
                'encrypted' => 0
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
    public function editService($package, $service, array $vars = array(), $parent_package = null, $parent_service = null)
    {
        // Perform manual renewals
        $renew = isset($vars["renew"]) ? (int)$vars["renew"] : 0;
        if ($renew > 0 && $vars["use_module"] == 'true') {
            // Call to renewService() to perform manual renewals
            $this->renewService($package, $service, $parent_package, $parent_service, $renew);
            unset($vars['renew']);
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
        $this->suspendService($package, $service, $parent_package = null, $parent_service = null);
        #return null; // Nothing to do
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
        $row = $this->getModuleRow($package->module_row);
        $api = $this->getApi($row->meta->user, $row->meta->key, $row->meta->sandbox == 'true');
        $all = new IspapiAll($api);
        if ($package->meta->type == "domain") {
            $fields = $this->serviceFieldsToObject($service->fields);
            
            $command = array(
                "COMMAND" => "SetDomainRenewalMode",
                "DOMAIN" => $fields->domain,
                "RENEWALMODE" => "AUTOEXPIRE"
            );
            $response = $all->ispapiCall($command);

            $this->processResponse($api, $response);

            if ($this->Input->errors()) {
                return;
            }
        }

        return null; // Nothing to do
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
        // Credentials to API
        $row = $this->getModuleRow($package->module_row);
        $api = $this->getApi($row->meta->user, $row->meta->key, $row->meta->sandbox == 'true');
        $all = new IspapiAll($api);

        // Renew domain
        if ($package->meta->type == 'domain') {
            $fields = $this->serviceFieldsToObject($service->fields);

            $tld = trim($this->getTld($fields->domain), '.');
            $sld = trim(substr($fields->domain, 0, -strlen($tld)), '.');

            $vars['domain'] = $fields->{"domain"};
               
            if ($years) {
                $vars["NumYears"] = $years;
            }

            // Renew the domain
            $command = array(
                "COMMAND" => "RenewDomain",
                "DOMAIN" => $vars['domain'],
                "PERIOD" => $vars['NumYears']
            );
            $response = $all->ispapiCall($command);

            // Some of the TLDs require following command for renewals (eg: .de)
            if ($response->response()["CODE"] == 510) {
                $command["COMMAND"] = "PayDomainRenewal";
                $response = $all->ispapiCall($command);
            }

            $this->processResponse($api, $response);

            if ($this->Input->errors()) {
                return;
            }
        }

        return null;
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
        if (isset($vars['meta']) && is_array($vars['meta'])) {
            // Return all package meta fields
            foreach ($vars['meta'] as $key => $value) {
                $meta[] = [
                    'key' => $key,
                    'value' => $value,
                    'encrypted' => 0
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
        if (isset($vars['meta']) && is_array($vars['meta'])) {
            // Return all package meta fields
            foreach ($vars['meta'] as $key => $value) {
                $meta[] = [
                    'key' => $key,
                    'value' => $value,
                    'encrypted' => 0
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
        // Load the view into this object, so helpers can be automatically added to the view
        $this->view = new View('manage', 'default');
        $this->view->base_uri = $this->base_uri;
        $this->view->setDefaultView('components' . DS . 'modules' . DS . 'ispapi' . DS);

        // Load the helpers required for this view
        Loader::loadHelpers($this, ['Form', 'Html', 'Widget']);

        $this->view->set('module', $module);

        return $this->view->fetch();
    }

    /**
     * Returns the rendered view of the add module row page
     *
     * @param array $vars An array of post data submitted to or on the add
     *  module row page (used to repopulate fields after an error)
     * @return string HTML content containing information to display when viewing the add module row page
     */
    public function manageAddRow(array &$vars)
    {
        // Load the view into this object, so helpers can be automatically added to the view
        $this->view = new View('add_row', 'default');
        $this->view->base_uri = $this->base_uri;
        $this->view->setDefaultView('components' . DS . 'modules' . DS . 'ispapi' . DS);

        // Load the helpers required for this view
        Loader::loadHelpers($this, ['Form', 'Html', 'Widget']);

        // Set unspecified checkboxes
        if (!empty($vars)) {
            if (empty($vars['sandbox'])) {
                $vars['sandbox'] = 'false';
            }
        }

        $this->view->set('vars', (object)$vars);

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
        $this->view = new View('edit_row', 'default');
        $this->view->base_uri = $this->base_uri;
        $this->view->setDefaultView('components' . DS . 'modules' . DS . 'ispapi' . DS);

        // Load the helpers required for this view
        Loader::loadHelpers($this, ['Form', 'Html', 'Widget']);

        if (empty($vars)) {
            $vars = $module_row->meta;
        } else {
            // Set unspecified checkboxes
            if (empty($vars['sandbox'])) {
                $vars['sandbox'] = 'false';
            }
        }

        $this->view->set('vars', (object)$vars);
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
    public function addModuleRow(array &$vars)
    {
        $meta_fields = ['user', 'key', 'sandbox'];
        $encrypted_fields = ['key'];

        // Set unspecified checkboxes
        if (empty($vars['sandbox'])) {
            $vars['sandbox'] = 'false';
        }

        $this->Input->setRules($this->getRowRules($vars));

        // Validate module row
        if ($this->Input->validates($vars)) {
            // Build the meta data for this row
            $meta = array();
            foreach ($vars as $key => $value) {
                if (in_array($key, $meta_fields)) {
                    $meta[] = [
                        'key' => $key,
                        'value' => $value,
                        'encrypted' => in_array($key, $encrypted_fields) ? 1 : 0
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
        // Same as adding
        return $this->addModuleRow($vars);
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
        Loader::loadHelpers($this, ['Html']);

        $fields = new ModuleFields();

        $types = [
            'domain' => Language::_('Ispapi.package_fields.type_domain', true),
        ];

        // Set type of package
        $type = $fields->label(Language::_('Ispapi.package_fields.type', true), 'ispapi_type');

        $type->attach(
            $fields->fieldSelect(
                'meta[type]',
                $types,
                $this->Html->ifSet($vars->meta['type']),
                ['id' => 'ispapi_type']
            )
        );
        $fields->setField($type);

        // Set all TLDs
        $tld_options = $fields->label(Language::_('Ispapi.package_fields.tld_options', true));

        $tlds = Configure::get('Ispapi.tlds');

        sort($tlds);

        // Set all TLDs Dropdown
        foreach ($tlds as $key => $val) {
            $tlds_array[$val]=$val;
        }
        $tld_options->attach($fields->fieldSelect("meta[tlds][]", $tlds_array, $this->Html->ifSet($vars->meta['tlds']), array('id'=>"tlds")));

        $fields->setField($tld_options);

        // Set nameservers
        for ($i=1; $i<=5; $i++) {
            $type = $fields->label(Language::_('Ispapi.package_fields.ns' . $i, true), 'ispapi_ns' . $i);
            $type->attach(
                $fields->fieldText(
                    'meta[ns][]',
                    $this->Html->ifSet($vars->meta['ns'][$i-1]),
                    ['id' => 'ispapi_ns' . $i]
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
						if (type == 'ssl')
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
     * Returns an array of key values for fields stored for a module, package,
     * and service under this module, used to substitute those keys with their
     * actual module, package, or service meta values in related emails.
     *
     * @return array A multi-dimensional array of key/value pairs where each key
     *  is one of 'module', 'package', or 'service' and each value is a numerically
     *  indexed array of key values that match meta fields under that category.
     * @see Modules::addModuleRow()
     * @see Modules::editModuleRow()
     * @see Modules::addPackage()
     * @see Modules::editPackage()
     * @see Modules::addService()
     * @see Modules::editService()
     */
    public function getEmailTags()
    {
        return ['service' => ['domain']];
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
        Loader::loadHelpers($this, array("Form", "Html"));
        if ($package->meta->type == "domain") {
            // Set default name servers
            if (!isset($vars->ns1) && isset($package->meta->ns)) {
                $i = 1;
                foreach ($package->meta->ns as $ns) {
                    $vars->{"ns" . $i++} = $ns;
                }
            }

            $fields = array(
                'domainoptions' => array(
                    'label' => Language::_("Ispapi.domain.DomainAction", true),
                    'type' => "radio",
                    'value' => "1",
                    'options' => array(
                        '1' => "Register",
                        '2' => "Transfer",
                    )
                ),
                'domain' => array(
                    'label' => Language::_("Ispapi.domain.domain", true),
                    'type' => "text"
                ),
                'transfer_key' => array(
                    'label' => Language::_("Ispapi.transfer.EPPCode", true),
                    'type' => "text"
                )
            );
            // Handle transfer request
            if ((isset($vars->transfer) && $vars->transfer === 'true') || !empty($vars->transfer_key)) {
                return $this->arrayToModuleFields(array_merge($fields, Configure::get("Ispapi.transfer_fields"), Configure::get("Ispapi.nameserver_fields")), null, $vars);
            } else {
                // Handle domain registration
                $module_fields = $this->arrayToModuleFields(array_merge($fields, Configure::get("Ispapi.nameserver_fields")), null, $vars);

                // Additional domain fields
                if (isset($vars->domain)) {
                    $tld = $this->getTld($vars->domain);
        
                    if ($tld) {
                        $extension_fields = array_merge((array)Configure::get("Ispapi.domain_fields" . $tld), (array)Configure::get("Ispapi.contact_fields" . $tld));
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
                            $('input[name=\"domain\"]').change(function() {
                                $('input[type=radio]').attr('checked',false);
                                var form = $(this).closest('form');
                                $(form).append('<input type=\"hidden\" name=\"refresh_fields\" value=\"true\">');
                                $(form).submit();
                            });
                        });
                    </script>
                ");
            }
        }
        return (isset($module_fields) ? $module_fields : new ModuleFields());
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

        if ($package->meta->type == 'domain') {
            // Set default name servers
            if (!isset($vars->ns) && isset($package->meta->ns)) {
                $i=1;
                foreach ($package->meta->ns as $ns) {
                    $vars->{'ns' . $i++} = $ns;
                }
            }

            // Handle transfer request
            if (isset($vars->transfer) || isset($vars->transfer_key)) {
                $fields = array_merge(Configure::get('Ispapi.transfer_fields'), Configure::get('Ispapi.nameserver_fields'));

                // Already have the domain name don't make editable
                $fields['domain']['type'] = 'hidden';
                $fields['domain']['label'] = null;

                return $this->arrayToModuleFields($fields, null, $vars);
            } else {
                // Handle domain registration
                $fields = array_merge(Configure::get('Ispapi.nameserver_fields'), Configure::get('Ispapi.domain_fields'));

                // Already have the domain name don't make editable
                $fields['domain']['type'] = 'hidden';
                $fields['domain']['label'] = null;

                $module_fields = $this->arrayToModuleFields($fields, null, $vars);

                if (isset($vars->domain)) {
                    $tld = $this->getTld($vars->domain);

                    $extension_fields = Configure::get('Ispapi.domain_fields' . $tld);
                    if ($extension_fields) {
                        $module_fields = $this->arrayToModuleFields($extension_fields, $module_fields, $vars);
                    }
                }

                return $module_fields;
            }
        } else {
            return new ModuleFields();
        }
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
        Loader::loadHelpers($this, array("Form", "Html"));
        $fields = new ModuleFields();
        
        // Manual renewal request
        #$note = $fields->label( Language::_( "Ispapi.renew.note", true ), "note" );
        #$fields->setField($note);
        // Create domain label
        $domain = $fields->label(Language::_("Ispapi.manage.manual_renewal", true), "renew");

        $row = $this->getModuleRow($package->module_row);
        $api = $this->getApi($row->meta->user, $row->meta->key, $row->meta->sandbox == 'true');
        $all = new IspapiAll($api);

        // Supported renewal periods of TLD
        $command = array(
            "COMMAND" => "QueryDomainOptions",
            "DOMAIN0" => $vars->domain,
            "PROPERTIES" => "LAUNCHPHASES"
        );
        $response_querydomainoptions = $all->ispapiCall($command);
        $this->processResponse($api, $response_querydomainoptions);
        $response_querydomainoptions = $response_querydomainoptions->response();

        $renewalperiods = array(0);
        foreach (explode(",", $response_querydomainoptions['PROPERTY']['ZONERENEWALPERIODS'][0]) as $key) {
            array_push($renewalperiods, $key);
        }

        // Create domain field and attach to domain label
        $domain->attach($fields->fieldSelect("renew", $renewalperiods, array('id'=>"renew")));
        $fields->setField($domain);

        // Display domain information
        $domain_information = $fields->label(Language::_("Ispapi.domain.domaininformation", true), "domaininformation");
        // Domain status
        $domain_status = $fields->label(Language::_("Ispapi.domain.domainstatus", true), "domainstatus");
        // Expiry date
        $expirydate = $fields->label(Language::_("Ispapi.domain.expirydate", true), "expirydate");

        if ($package->meta->type == 'domain') {
            $command = array(
                "COMMAND" => "StatusDomain",
                "DOMAIN" => $vars->domain,
            );
            $response = $all->ispapiCall($command);
            // To handle api error messages
            $this->processResponse($api, $response);

            $response = $response->response();
            if ($response["CODE"] == 200) {
                $status = $response["PROPERTY"]["STATUS"][0];
                // Status of the domain at our system
                if (preg_match('/ACTIVE/i', $status)) {
                    $values["status"] = 'Active';
                } elseif (preg_match('/DELETE/i', $status)) {
                    $values['status'] = 'Expired';
                }
                // Expiry date at our system
                if ($response["PROPERTY"]["FAILUREDATE"][0] > $response["PROPERTY"]["PAIDUNTILDATE"][0]) {
                    $paiduntildate = preg_replace('/ .*/', '', $response["PROPERTY"]["PAIDUNTILDATE"][0]);
                    $values['expirydate'] = $paiduntildate;
                } else {
                    $accountingdate = preg_replace('/ .*/', '', $response["PROPERTY"]["ACCOUNTINGDATE"][0]);
                    $values['expirydate'] = $accountingdate;
                }
            }

            $domain_status->attach($fields->fieldText((isset($values['status']) ? $values['status'] : ""), array('id'=>$values['status']), array('readonly'=>'readonly')));
            $expirydate->attach($fields->fieldText((isset($values['expirydate']) ? $values['expirydate'] : ""), array('id'=>$values['expirydate']), array('readonly'=>'readonly')));
        }
        
        $fields->setField($domain_information);
        $fields->setField($domain_status);
        $fields->setField($expirydate);

        #return $fields;
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
        return '';
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
        return '';
    }

    /**
     * Returns all tabs to display to an admin when managing a service whose
     * package uses this module
     *
     * @param stdClass $package A stdClass object representing the selected package
     * @return array An array of tabs in the format of method => title.
     *  Example: array('methodName' => "Title", 'methodName2' => "Title2")
     */
    public function getAdminTabs($package)
    {
        if ($package->meta->type == 'domain') {
            return [
                'tabWhois' => Language::_('Ispapi.tab_whois.title', true),
                'tabNameservers' => Language::_('Ispapi.tab_nameservers.title', true),
                'tabSettings' => Language::_('Ispapi.tab_settings.title', true),
            ];
        } else {
            # Handle other services than ''domain'. for eg: ssl certificates
        }
    }

    /**
     * Returns all tabs to display to a client when managing a service whose
     * package uses this module
     *
     * @param stdClass $package A stdClass object representing the selected package
     * @return array An array of tabs in the format of method => title.
     *  Example: array('methodName' => "Title", 'methodName2' => "Title2")
     */
    public function getClientTabs($package)
    {
        if ($package->meta->type == 'domain') {
            return [
                'tabClientWhois' => Language::_('Ispapi.tab_whois.title', true),
                'tabClientNameservers' => Language::_('Ispapi.tab_nameservers.title', true),
                'tabClientSettings' => Language::_('Ispapi.tab_settings.title', true)
            ];
        } else {
            # Handle other services than 'domain'. for eg: ssl certificates
        }
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
        return $this->manageWhois('tab_whois', $package, $service, $get, $post, $files);
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
        return $this->manageWhois('tab_client_whois', $package, $service, $get, $post, $files);
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
        return $this->manageNameservers('tab_nameservers', $package, $service, $get, $post, $files);
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
        return $this->manageNameservers('tab_client_nameservers', $package, $service, $get, $post, $files);
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
        return $this->manageSettings('tab_settings', $package, $service, $get, $post, $files);
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
        return $this->manageSettings('tab_client_settings', $package, $service, $get, $post, $files);
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
        $this->view = new View($view, 'default');
        // Load the helpers required for this view
        Loader::loadHelpers($this, ['Form', 'Html']);

        $row = $this->getModuleRow($package->module_row);
        $api = $this->getApi($row->meta->user, $row->meta->key, $row->meta->sandbox == 'true');
        $all = new IspapiAll($api);

        $vars = new stdClass();

        $whois_fields = Configure::get('Ispapi.whois_fields');

        $fields = $this->serviceFieldsToObject($service->fields);

        $whois_sections = Configure::get('Ispapi.whois_sections');

        $tld = trim($this->getTld($fields->domain), '.');
        $sld = trim(substr($fields->domain, 0, -strlen($tld)), '.');

        if (!empty($post)) {
            // Modify/update contact/whois information
            $command = array(
                "COMMAND" => "ModifyDomain",
                "DOMAIN" => $fields->domain
            );

            $map = array(
                "OWNERCONTACT0" => "Registrant",
                "ADMINCONTACT0" => "Admin",
                "TECHCONTACT0" => "Tech",
                "BILLINGCONTACT0" => "Billing",
            );

            foreach ($map as $ctype => $ptype) {
                $command[$ctype] = array(
                    "FIRSTNAME" => html_entity_decode($post[$ptype."FirstName"], ENT_QUOTES | ENT_XML1, 'UTF-8'),
                    "LASTNAME" => html_entity_decode($post[$ptype."LastName"], ENT_QUOTES | ENT_XML1, 'UTF-8'),
                    "ORGANIZATION" => html_entity_decode($post[$ptype."Organization"], ENT_QUOTES | ENT_XML1, 'UTF-8'),
                    "STREET" => html_entity_decode($post[$ptype."Address1"], ENT_QUOTES | ENT_XML1, 'UTF-8'),
                    "CITY" => html_entity_decode($post[$ptype."City"], ENT_QUOTES | ENT_XML1, 'UTF-8'),
                    "STATE" => html_entity_decode($post[$ptype."StateProvince"], ENT_QUOTES | ENT_XML1, 'UTF-8'),
                    "ZIP" => html_entity_decode($post[$ptype."PostalCode"], ENT_QUOTES | ENT_XML1, 'UTF-8'),
                    "COUNTRY" => html_entity_decode($post[$ptype."Country"], ENT_QUOTES | ENT_XML1, 'UTF-8'),
                    "PHONE" => html_entity_decode($post[$ptype."Phone"], ENT_QUOTES | ENT_XML1, 'UTF-8'),
                    "EMAIL" => html_entity_decode($post[$ptype."EmailAddress"], ENT_QUOTES | ENT_XML1, 'UTF-8'),
                );
                if (strlen($post[$ptype."Address2"])) {
                    $command[$ctype]["STREET"] .= " , ".html_entity_decode($post[$ptype."Address2"], ENT_QUOTES | ENT_XML1, 'UTF-8');
                }
            }

            $response = $all->ispapiCall($command);
            $this->processResponse($api, $response);

            $vars = (object)$post;
        } else {
            // To get the contact details of a domain, first perform a StatusDomain command and then use the data from StatusDomain to perform the StatusContact command.
            $command = array(
                "COMMAND" => "StatusDomain",
                "DOMAIN" => $fields->domain,
            );
            $response = $all->ispapiCall($command);
            // To handle api error messages
            $this->processResponse($api, $response);
            $response = $response->response();
            if ($response['CODE'] == 200) {
                $contacts_array = array(
                    "Registrant" =>$response['PROPERTY']['OWNERCONTACT'][0],
                    "Admin" =>$response['PROPERTY']['ADMINCONTACT'][0],
                    "Tech" =>$response['PROPERTY']['TECHCONTACT'][0],
                    "Billing" =>$response['PROPERTY']['BILLINGCONTACT'][0],
                );
                foreach ($contacts_array as $key => $contact) {
                    $command = array(
                        "COMMAND" => "StatusContact",
                        "CONTACT" => $contact,
                    );
                    $response = $all->ispapiCall($command);
                    // To handle api error messages
                    $this->processResponse($api, $response);
                    $data[$key] = $response->response()['PROPERTY'];
                }
                // Display owner, tech and billing contact details
                foreach ($whois_sections as $section) {
                    if (isset($data[$section])) {
                        foreach ($data[$section] as $name) {
                            $vars->{$section.'FirstName'} = ($data[$section]['FIRSTNAME'] ? $data[$section]['FIRSTNAME'][0] : '');
                            $vars->{$section.'LastName'} = ($data[$section]['LASTNAME'] ? $data[$section]['LASTNAME'][0] : '');
                            $vars->{$section.'Organization'} = ($data[$section]['ORGANIZATION'] ? $data[$section]['ORGANIZATION'][0] : '');
                            if ((count($data[$section]['STREET']) < 2) && preg_match('/^(.*) , (.*)/', $data[$section]['STREET'][0], $m)) {
                                $vars->{$section.'Address1'} = $m[1];
                                $vars->{$section.'Address2'} = $m[2];
                            } else {
                                $vars->{$section.'Address1'} = ($data[$section]['STREET'] ? $data[$section]['STREET'][0] : '');
                            }
                            $vars->{$section.'City'} = ($data[$section]['CITY'] ? $data[$section]['CITY'][0] : '');
                            $vars->{$section.'StateProvince'} = ($data[$section]['STATE'] ? $data[$section]['STATE'][0] : '');
                            $vars->{$section.'PostalCode'} = ($data[$section]['ZIP'] ? $data[$section]['ZIP'][0] : '');
                            $vars->{$section.'Country'} = ($data[$section]['COUNTRY'] ? $data[$section]['COUNTRY'][0] : '');
                            $vars->{$section.'Phone'} = ($data[$section]['PHONE'] ? $data[$section]['PHONE'][0] : '');
                            $vars->{$section.'EmailAddress'} = ($data[$section]['EMAIL'] ? $data[$section]['EMAIL'][0] : '');
                        }
                    }
                }
            }
        }

        $this->view->set('vars', $vars);
        $this->view->set('fields', $this->arrayToModuleFields($whois_fields, null, $vars)->getFields());
        $this->view->set('sections', ['Registrant', 'Admin', 'Tech', 'Billing']);
        $this->view->setDefaultView('components' . DS . 'modules' . DS . 'ispapi' . DS);
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
        $this->view = new View($view, 'default');

        // Load the helpers required for this view
        Loader::loadHelpers($this, ['Form', 'Html']);

        $vars = new stdClass();

        $row = $this->getModuleRow($package->module_row);
        $api = $this->getApi($row->meta->user, $row->meta->key, $row->meta->sandbox == 'true');
        $all = new IspapiAll($api);

        $fields = $this->serviceFieldsToObject($service->fields);

        if (!empty($post)) {
            // Modify and save nameservers
            $vars = $post;
            // Default to using default nameservers
            $vars['usedns'] = 'Default';
            foreach ($vars['ns'] as $i => $ns) {
                if ($ns != '') {
                    $vars['ns' . ($i+1)] = $ns;
                    unset($vars['usedns']);
                }
            }
            unset($vars['ns']);

            $command = array(
                "COMMAND" => "ModifyDomain",
                "DOMAIN" => $fields->domain,
                "NAMESERVER" => array($vars["ns1"], $vars["ns2"], $vars["ns3"], $vars["ns4"], $vars["ns5"]),
                "INTERNALDNS" => 1
            );

            $response = $all->ispapiCall($command);

            // Display if there are any error
            $this->processResponse($api, $response);

            $vars = (object)$post;
        } else {
            // Get nameservers
            $command = array(
                "COMMAND" => "StatusDomain",
                "DOMAIN" => $fields->domain,
            );

            $response = $all->ispapiCall($command)->response();

            if ($response['CODE'] == 200) {
                $data = $response['PROPERTY'];
                
                if (isset($data['NAMESERVER'])) {
                    foreach ($data['NAMESERVER'] as $ns) {
                        $vars->ns[] = $ns;
                    }
                }
            }
        }

        $this->view->set('vars', $vars);
        $this->view->setDefaultView('components' . DS . 'modules' . DS . 'ispapi' . DS);
        return $this->view->fetch();
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
        $this->view = new View($view, 'default');
        // Load the helpers required for this view
        Loader::loadHelpers($this, ['Form', 'Html']);

        $vars = new stdClass();

        $row = $this->getModuleRow($package->module_row);
        $api = $this->getApi($row->meta->user, $row->meta->key, $row->meta->sandbox == 'true');
        $all = new IspapiAll($api);

        $fields = $this->serviceFieldsToObject($service->fields);

        $tld = trim($this->getTld($fields->domain), '.');
        $sld = trim(substr($fields->domain, 0, -strlen($tld)), '.');

        // Whois privacy settings of a TLD
        $command = array(
            "COMMAND" => "QueryDomainOptions",
            "DOMAIN0" => $fields->domain,
            "PROPERTIES" => "LAUNCHPHASES"
        );
        $response_querydomainoptions = $all->ispapiCall($command);
        $this->processResponse($api, $response_querydomainoptions);
        $response_querydomainoptions = $response_querydomainoptions->response();

        // Status domain
        $command = array(
            "COMMAND" => "StatusDomain",
            "DOMAIN" => $fields->domain
        );
        $response = $all->ispapiCall($command);
        $this->processResponse($api, $response);

        // Display whoi_privacy setting for the domain if it is supported
        if (!empty($response_querydomainoptions['PROPERTY']['X-PROXY'][0])) {
            $vars->{'whois_privacy_supported'} = 'yes';
        }

        if (!empty($post)) {
            // Post values to var variable
            $vars->registrar_lock = $post['registrar_lock'];
            $vars->whois_privacy = $post['whois_privacy'];

            // To get epp/auth code
            if (isset($post['request_epp']) && !isset($post['save'])) {
                // NOTE - .de and .eu domains should be handled differently to get auth info.
                if (strlen($response->response()["PROPERTY"]["AUTH"][0])) {
                    $vars->{'auth'} = $response->response()["PROPERTY"]["AUTH"][0];
                } else {
                    $errors = "No AuthInfo code assigned to this domain!";
                    $errors = (object)$errors;
                    $this->Input->setErrors(['errors' => $errors]);
                }
            }

            // Save transferlock settings of a domain
            if ((isset($post['registrar_lock']) || isset($post['whois_privacy'])) && isset($post['save'])) {
                $command = array(
                    "COMMAND" => "ModifyDomain",
                    "DOMAIN" => $fields->domain,
                    "TRANSFERLOCK" => $post['registrar_lock'] == 'true' ? '1' : '0',
                );
                
                if ($vars->whois_privacy_supported) {
                    $command['X-ACCEPT-WHOISTRUSTEE-TAC'] = $post['whois_privacy'] == 'true' ? '1' : '0';
                }

                $modify_registrarlock_response = $all->ispapiCall($command);

                $this->processResponse($api, $modify_registrarlock_response);
            }
        } else {
            // Get transferlock and whois privacy settings information
            if ($response->response()['CODE'] == 200) {
                $data = $response->response()['PROPERTY'];

                $vars->registrar_lock = $data['TRANSFERLOCK'][0] == '1' ? 'true' : 'false';
                // Whois privacy
                $vars->whois_privacy = $data['X-ACCEPT-WHOISTRUSTEE-TAC'][0] == '1' ? 'true' : 'false';
            }
        }
 
        $this->view->set('vars', $vars);
        $this->view->setDefaultView('components' . DS . 'modules' . DS . 'ispapi' . DS);
        return $this->view->fetch();
    }

    /**
     * Performs a whois lookup on the given domain
     *
     * @param string $domain The domain to lookup
     * @return bool True if available, false otherwise
     */
    public function checkAvailability($domain)
    {
        $row = $this->getModuleRow();
        $api = $this->getApi($row->meta->user, $row->meta->key, $row->meta->sandbox == 'true');

        $all = new IspapiAll($api);

        $command = array(
            "COMMAND" => "CheckDomain",
            "DOMAIN" => $domain,
        );
        
        $response = $all->ispapiCall($command);
        // Handling api errors
        $this->processResponse($api, $response);
        $response = $response->response();
        // Code 210 is for avaialble domains
        if ($response['CODE'] != '210') {
            return false;
        }

        return $response['CODE'] == 210;
    }

    /**
     * Builds and returns the rules required to add/edit a module row
     *
     * @param array $vars An array of key/value data pairs
     * @return array An array of Input rules suitable for Input::setRules()
     */
    private function getRowRules(&$vars)
    {
        return [
            'user' => [
                'valid' => [
                    'rule' => 'isEmpty',
                    'negate' => true,
                    'message' => Language::_('Ispapi.!error.user.valid', true)
                ]
            ],
            'key' => [
                'valid' => [
                    'last' => true,
                    'rule' => 'isEmpty',
                    'negate' => true,
                    'message' => Language::_('Ispapi.!error.key.valid', true)
                ],
                'valid_connection' => [
                    'rule' => [
                        [$this, 'validateConnection'],
                        $vars['user'],
                        isset($vars['sandbox']) ? $vars['sandbox'] : 'false'
                    ],
                    'message' => Language::_('Ispapi.!error.key.valid_connection', true)
                ]
            ]
        ];
    }

    /**
     * Validates that the given connection details
     *
     * @param string $key The API key
     * @param string $user The API user
     * @param string $sandbox "true" if this is a sandbox account, false otherwise
     * @return bool True if the connection details are valid, false otherwise
     */
    public function validateConnection($key, $user, $sandbox)
    {
        $api = $this->getApi($user, $key, $sandbox == 'true');
        $all = new IspapiAll($api);

        $command = array(
            "COMMAND" => "CheckAuthentication",
            "SUBUSER" => $user,
            "PASSWORD" => $key
        );

        $response = $all->ispapiCall($command);

        if ($response->response()['CODE'] == 200) {
            // Workarround to call that only 1 time.
            static $included = false;

            if (!$included) {
                $included = true;

                $hostname = $_SERVER["HTTP_HOST"];
                $date = date('Y-m-d H:i:s') . " (UTC)";
                $version = phpversion();
                $envkey = "middleware/blesta/$hostname";
                $module_version = self::$version;
    
                $values = array();
    
                $values['blesta'] = BLESTA_VERSION;
                $values['updated_date'] = $date;
                $values['ispapi_version'] = $module_version;
                $values['php_version'] = $version;
        
                $command = array(
                    "COMMAND" => "SetEnvironment",
                );
                $i=0;
                foreach ($values as $key => $value) {
                    $command["ENVIRONMENTKEY$i"] = $envkey;
                    $command["ENVIRONMENTNAME$i"] = $key;
                    $command["ENVIRONMENTVALUE$i"] = $value;
                    $i++;
                }
    
                $set_environment_response = $all->ispapiCall($command);
            }
            
            return 'OK';
        } else {
            return null;
        }
        #return $all->ispapiCall($command)->response()['CODE'] == 200 ? 'OK': null;
    }

    /**
     * Initializes the IspapiApi and returns an instance of that object
     *
     * @param string $user The user to connect as
     * @param string $key The key to use when connecting
     * @param bool $sandbox Whether or not to process in sandbox mode (for testing)
     * @return IspapiApi The IspapiApi instance
     */
    private function getApi($user, $key, $sandbox)
    {

        Loader::load(dirname(__FILE__) . DS . 'apis' . DS . 'ispapi_api.php');

        return new IspapiApi($user, $key, $sandbox);
    }

    /**
     * Process API response, setting an errors, and logging the request
     *
     * @param IspapiApi $api The ispapi API object
     * @param IspapiResponse $response The ispapi API response object
     */
    private function processResponse(IspapiApi $api, IspapiResponse $response)
    {
        $this->logRequest($api, $response);

        // Set errors, if any
        if ($response->response()['CODE'] != 200) {
            $errors = $response->response()['DESCRIPTION'] ? $response->response()['DESCRIPTION'] : [];
            $errors = (object)$errors;
            $this->Input->setErrors(['errors' => $errors]);
        }
    }

    /**
     * Logs the API request
     *
     * @param IspapiApi $api The ispapi API object
     * @param IspapiResponse $response The ispapi API response object
     */
    private function logRequest(IspapiApi $api, IspapiResponse $response)
    {
        $last_request = $api->lastRequest();
        $last_request['args']['pw'] = 'xxxx';

        $this->log($last_request['url'], serialize($last_request['args']), 'input', true);
        $this->log($last_request['url'], $response->raw(), 'output', $response->response()['CODE'] == 200 ? true : false);
    }

    /**
     * Returns the TLD of the given domain
     *
     * @param string $domain The domain to return the TLD from
     * @return string The TLD of the domain
     */
    private function getTld($domain)
    {
        $tlds = Configure::get('Ispapi.tlds');
        $domain = strtolower($domain);

        foreach ($tlds as $tld) {
            if (substr($domain, -strlen($tld)) == $tld) {
                return $tld;
            }
        }

        return strstr($domain, '.');
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
            Loader::loadModels($this, ['Contacts']);
        }

        return $this->Contacts->intlNumber($number, $country, '.');
    }
}
