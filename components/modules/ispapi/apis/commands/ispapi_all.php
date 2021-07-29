<?php
/**
 * Ispapi API request funnel
 *
 * @copyright Copyright (c) 2018-2021, HEXONET
 * @license https://raw.githubusercontent.com/hexonet/blesta-ispapi-registrar/master/LICENSE MIT
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
    public function call($command)
    {
        return $this->api->submit($command);
    }
}
