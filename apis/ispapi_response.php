<?php
/**
 * Ispapi API response handler
 *
 * @copyright Copyright (c) 2013, Phillips Data, Inc.
 * @license http://opensource.org/licenses/mit-license.php MIT License
 * @package ispapi
 */
class IspapiResponse
{
    /**
     * @var parsed response from the API
     */
    private $hash;
    /**
     * @var string The raw response from the API
     */
    private $raw;

    /**
     * Initializes the Ispapi Response
     *
     * @param string $response The raw XML response data from an API request
     */
    public function __construct($response)
    {
        $this->raw = $response;
        $this->hash = $response; 
    }

    /**
     * Returns the CommandResponse
     *
     * @return stdClass A stdClass object representing the CommandResponses, null if invalid response
     */
    public function response()
    {
        if (is_array($this->hash)) return $this->hash;
        $response = array(
            "PROPERTY" => array(),
            "CODE" => "423",
            "DESCRIPTION" => "Empty response from API"
        );
        if (!$this->hash) return $response;
        $rlist = explode( "\n", $this->hash );
        foreach ( $rlist as $item ) {
            if ( preg_match("/^([^\=]*[^\t\= ])[\t ]*=[\t ]*(.*)$/", $item, $m) ) {
                $attr = $m[1];
                $value = $m[2];
                $value = preg_replace( "/[\t ]*$/", "", $value );
                if ( preg_match( "/^property\[([^\]]*)\]/i", $attr, $m) ) {
                    $prop = strtoupper($m[1]);
                    $prop = preg_replace( "/\s/", "", $prop );                    
                    if ( in_array($prop, array_keys($response["PROPERTY"])) ) {                    
                        array_push($response["PROPERTY"][$prop], $value);
                    }
                    else {
                        $response["PROPERTY"][$prop] = array($value);
                    }
                }
                else {
                    $response[strtoupper($attr)] = $value;
                }
            }
        }
        if ( (!$response["CODE"]) || (!$response["DESCRIPTION"]) ) {
            $response = array(
                "PROPERTY" => array(),
                "CODE" => "423",
                "DESCRIPTION" => "Invalid response from API"
            );
        }

        return $response;
    }

    /**
     * Returns the raw response
     *
     * @return string The raw response
     */
    public function raw()
    {
        return $this->raw;
    }

}
