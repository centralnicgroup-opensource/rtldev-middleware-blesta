<?php

declare(strict_types=1);


class CnrBase
{
    private static ?Cnr $moduleInstance = null;
    private static ?\stdClass $module = null;

    public static function moduleInstance(?Cnr $instance = null): ?Cnr
    {
        if (self::$moduleInstance && !$instance) {
            return self::$moduleInstance;
        }
        return self::$moduleInstance = $instance;
    }

    public static function setModule(\stdClass $module): void
    {
        self::$module = $module;
    }

    public static function getModule(): ?\stdClass
    {
        return self::$module;
    }

    /**
     * Send one API command.
     *
     * @param array<string, mixed> $command
     * @return array<string, mixed> the response hash, or an error shape carrying
     *  CODE and error when the response code does not match $successCase
     */
    public function call(array $command, string $successCase = "/^200$/"): array
    {
        if (self::$module === null || self::$moduleInstance === null) {
            throw new \Exception("Row is not set. Please set row before making the call.");
        }

        $settings = CnrModuleSettings::fromRow(self::$module);

        // php-sdk v14 replaced the generic getClient(["registrar" => ...]) lookup
        // with one factory method per backend.
        $cl = \CNIC\ClientFactory::cnr();
        if ($settings->sandbox) {
            $cl->useOTESystem();
        }

        // HTTP_HOST is absent under the CLI SAPI, which is how Blesta runs its
        // cron - the daily domain_tld_synchronization task reaches this code.
        // setReferer() rejects null, so fall back to the company hostname and
        // then to an empty string, which the SDK treats as "send no Referer".
        $company = \Configure::get("Blesta.company");
        $referer = $_SERVER["HTTP_HOST"] ?? ($company->hostname ?? "");

        $cl->setCredentials($settings->user, $settings->key)
            ->setReferer($referer)
            ->setUserAgent("Blesta", defined("BLESTA_VERSION") ? BLESTA_VERSION : "unknown", [
                "cnic/" . self::$moduleInstance->getVersion(),
            ])
            ->enableDebugMode() // activate logging
            ->setCustomLogger(new CnrLogger(
                self::$module->module_id,
                $cl->getURL()
            ));
        if ($settings->proxyServer !== "") {
            $cl->setProxy($settings->proxyServer);
        }
        $r = $cl->request($command)->getHash();
        if (!preg_match($successCase, $r["CODE"])) {
            return [
                "success" => false,
                "CODE" => $r["CODE"],
                "error" => $r["CODE"] . " " . $r["DESCRIPTION"]
            ];
        }
        return $r;
    }
}
