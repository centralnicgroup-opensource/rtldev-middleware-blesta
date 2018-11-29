<?php
/**
 * Ispapi API request funnel
 *
 * @copyright Copyright (c) 2013, Phillips Data, Inc.
 * @license http://opensource.org/licenses/mit-license.php MIT License
 * @package ispapi.commands
 */
class IspapiAll
{
    /**
     * @var IspapiApi
     */
    private $api;

    /**
     * Sets the API to use for communication
     *
     * @param IspapiApi $api The API to use for communication
     */
    public function __construct(IspapiApi $api)
    {
        $this->api = $api;
    }

    /**
     * Returns the response from the Ispapi API
     *
     * @param array $vars An array of input params
     * @return IspapiResponse
     */
    public function ispapi_call($command)
    {  
        return $this->api->submit($command);
    }
}