<?php

use \HEXONET\Logger;
use \HEXONET\Response;

class BlestaLogger extends Logger
{
    private string $apiURL;
    private Ispapi $mod;
    
    public function __construct($mod, $apiURL)
    {
        $this->mod = $mod;
        $this->apiURL = $apiURL;
    }

    /**
     * output/log given data
     */
    public function log(string $post, Response $r, string $error = null): void
    {
        $this->mod->log(
            $this->apiURL,
            $r->getCommandPlain() . "\n" . $post,
            'input',
            true
        );
        
        $this->mod->log(
            $this->apiURL,
            ($error ? $error . "\n\n" : "") . $r->getPlain(),
            'output',
            $error ? false : $r->isSuccess()
        );
    }
}
