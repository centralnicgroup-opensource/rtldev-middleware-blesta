<?php
require_once dirname(__FILE__) . DIRECTORY_SEPARATOR . 'ispapi_response.php';
require_once dirname(__FILE__) . DIRECTORY_SEPARATOR . 'commands' . DIRECTORY_SEPARATOR . 'ispapi_all.php';

/**
 * Ispapi API processor
 *
 * Documentation on the Ispapi API: https://wiki.hexonet.net/wiki/Domain_API //TODO -is this link ok?
 *
 * @copyright Copyright (c) 2013, Phillips Data, Inc.
 * @license http://opensource.org/licenses/mit-license.php MIT License
 * @package ispapi
 */
class IspapiApi
{
    const URL = 'https://api.ispapi.net/api/call.cgi';

    /**
     * @var string The user to connect as
     */
    private $user; 

    /**
     * @var string The key to use when connecting
     */
    private $key;

    /**
     * @var bool Whether or not to process in sandbox mode (for testing)
     */
    private $sandbox;

    /**
     * @var string The user to connect as
     */
    private $entity; 

    /**
     * @var array An array representing the last request made
     */
    private $last_request = ['url' => null, 'args' => null];

    /**
     * Sets the connection details
     *
     * @param string $user The user to connect as
     * @param string $key The key to use when connecting
     * @param bool $sandbox Whether or not to process in sandbox mode (for testing)
     */
    public function __construct($user, $key, $sandbox = true)
    {
        $this->user = $user;
        $this->key = $key;
        $this->sandbox = $sandbox;
    }

    /**
     * Submits a request to the API
     *
     * @param string $command The command to submit
     * @param array $args An array of key/value pair arguments to submit to the given API command
     * @return IspapiResponse The response object
     */
    public function submit($command)
    {

        $args = array();

        $url = self::URL;
        // Entity is determined based on if sandbox is checked. Checked sandbox - OTE
        $entity = '54cd';
        if ($this->sandbox) {
            $entity = '1234';
        }
        
        $args["s_command"] =  $this->ispapi_encode_command($command);

        $args['s_login'] = $this->user;
        $args['s_pw'] = html_entity_decode($this->key, ENT_QUOTES);
        $args['s_entity'] = $entity;

        $this->last_request = [
            'url' => $url,
            'args' => $args
        ];

        $ch = curl_init($url);
        if ( $ch === FALSE ) {
            return "[RESPONSE]\nCODE=423\nAPI access error: curl_init failed\nEOF\n";
        }

        $postfields = array();
	    foreach ( $args as $key => $value ) {
		    $postfields[] = urlencode($key)."=".urlencode($value);
        }
        $postfields = implode('&', $postfields);
        curl_setopt( $ch, CURLOPT_POST, 1 );
	    curl_setopt( $ch, CURLOPT_POSTFIELDS, $postfields );
	    curl_setopt( $ch, CURLOPT_HEADER, 0 );
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER , 1 );
        $response = curl_exec($ch);

        return new IspapiResponse($response);
    }

    // Provided command needs to be encoded.
    private function ispapi_encode_command( $commandarray ) {
        if (!is_array($commandarray)) return $commandarray;
        $command = "";
        foreach ( $commandarray as $k => $v ) {
            if ( is_array($v) ) {
            $v = $this->ispapi_encode_command($v);
                $l = explode("\n", trim($v));
                foreach ( $l as $line ) {
                    $command .= "$k$line\n";
                }
            }
            else {
                $v = preg_replace( "/\r|\n/", "", $v );
                $command .= "$k=$v\n";
            }
        }
        return $command;
    }

    
    /**
     * Returns the details of the last request made
     *
     * @return array An array containg:
     *  - url The URL of the last request
     *  - args The paramters passed to the URL
     */
    public function lastRequest()
    {
        return $this->last_request;
    }
}

