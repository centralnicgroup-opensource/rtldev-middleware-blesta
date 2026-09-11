<?php

use Blesta\Core\Util\Common\Traits\Container;
use CNIC\ResponseInterface;

class CnrLogger implements \CNIC\LoggerInterface
{
    use Container;

    private string $apiURL;
    private ?int $module_row_id;
    private ?string $log_group = null;

    public function __construct(?int $module_row_id, string $apiURL)
    {
        $this->module_row_id = $module_row_id;
        $this->apiURL = $apiURL;
    }

    /**
     * Build the debug record for a request/response pair.
     *
     * Required by CNIC\LoggerInterface since php-sdk v14. This class implements
     * the interface directly rather than extending CNIC\AbstractLogger, because
     * that base class declares log() final and writes to its own sink - the
     * records here have to go to Blesta's module log instead.
     *
     * @param string $post post request data in string format (already masked)
     */
    public function format(string $post, ResponseInterface $response, ?string $error = null): string
    {
        return implode("\n", [
            print_r($response->getCommand(), true),
            $post,
            $error !== null && $error !== "" ? "HTTP communication failed: " . $error : "",
            $response->getPlain(),
        ]);
    }

    /**
     * output/log given data
     * @param string $post post request data in string format
     * @param ResponseInterface $r Response to log
     * @param string|null $error error message
     */
    public function log(string $post, ResponseInterface $r, ?string $error = null): void
    {
        $this->logHandle(
            $this->apiURL,
            "Function: " . $this->backtraceFn() . "\n" . $r->getCommandPlain() . "\n" . $post,
            'input',
            true
        );

        $this->logHandle(
            $this->apiURL,
            ($error ? $error . "\n\n" : "") . $r->getPlain(),
            'output',
            $error ? false : $r->isSuccess()
        );
    }

    /**
     * Attempts to log the given info to the module log.
     *
     * @param string $url The URL contacted for this request
     * @param string $data A string of module data sent along with the request (optional)
     * @param string $direction The direction of the log entry (input or output, default input)
     * @param bool $success True if the request was successful, false otherwise
     * @return string|null The 8-character group identifier linking log entries,
     *  or null when there is no module row to log against yet
     * @throws Exception Thrown if $data was invalid and could not be added to the log
     */
    protected function logHandle(
        string $url,
        ?string $data = null,
        string $direction = 'input',
        bool $success = false
    ): ?string {
        // No module row id yet when credentials are being added for the first time
        if (!$this->module_row_id) {
            return null;
        }

        if (!isset($this->Logs)) {
            \Loader::loadModels($this, ['Logs']);
        }

        // Registry data reaches us single-byte encoded often enough to matter.
        // Blesta's log table is utf8mb4 and the connection runs in TRADITIONAL
        // sql_mode, so one stray byte aborts the whole request with a
        // PDOException instead of being truncated - the API call itself then
        // fails over a log write. Normalise before handing the data over.
        if ($data !== null && !mb_check_encoding($data, 'UTF-8')) {
            $data = mb_convert_encoding($data, 'UTF-8', 'ISO-8859-1');
        }

        // Create a random 8-character group identifier
        if ($this->log_group == null) {
            $this->log_group = substr(md5((string) mt_rand()), mt_rand(0, 23), 8);
        }

        $requestor = $this->getFromContainer('requestor');

        $log = [
            'staff_id' => $requestor->staff_id,
            'module_id' => $this->module_row_id,
            'direction' => $direction,
            'url' => $url,
            'data' => $data,
            'status' => ($success ? 'success' : 'error'),
            'group' => $this->log_group
        ];
        $this->Logs->addModule($log);

        if (($error = $this->Logs->errors())) {
            throw new Exception(serialize($error));
        }

        return $this->log_group;
    }

    protected function backtraceFn(): string
    {
        $trace = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS | DEBUG_BACKTRACE_PROVIDE_OBJECT);
        $result = array();
        foreach ($trace as $t) {
            if (isset($t["class"]) && $t["class"] === "Cnr" && $t["function"] !== "_call") {
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
