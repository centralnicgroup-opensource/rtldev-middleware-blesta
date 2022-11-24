<?php

class BlestaLogger implements \CNIC\LoggerInterface
{
    private $apiURL;
    private $mod;

    public function __construct($mod, $apiURL)
    {
        $this->mod = $mod;
        $this->apiURL = $apiURL;
    }

    /**
     * output/log given data
     * @param string $post post request data in string format
     * @param \CNIC\HEXONET\Response $r Response to log
     * @param string|null $error error message
     */
    public function log(string $post, $r, string $error = null): void
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
