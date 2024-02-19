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
            "Function: " . $this->backtraceFn() . "\n" . $r->getCommandPlain() . "\n" . $post,
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

    public function backtraceFn()
    {
        $trace = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS | DEBUG_BACKTRACE_PROVIDE_OBJECT);
        $result = array();
        foreach ($trace as $t) {
            if (isset($t["function"]) && isset($t["class"]) && $t["class"] === "Ispapi" && $t["function"] !== "_call") {
                $result["fnName"] = strtolower($t["function"]);
                break;
            }
        }
        if (empty($result)) {
            $result["fnName"] = strtolower($trace[0]["function"]);
        }
        return $result["fnName"];
    }
}
