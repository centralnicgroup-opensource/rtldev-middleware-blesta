<?php

namespace HEXONET\MODULE\LIB;

class Base
{
    private static $ispapiInstance;
    private static $module;

    public static function getIspapiInstance($instance = null)
    {
        if (self::$ispapiInstance && !$instance) {
            return self::$ispapiInstance;
        }
        return self::$ispapiInstance = $instance;
    }

    public static function setModule(\stdClass $module)
    {
        self::$module = $module;
    }

    public static function getModule()
    {
        return self::$module;
    }

    public function call(array $command, string $successCase = "/^200$/")
    {
        if (self::$module === null || self::$ispapiInstance === null) {
            throw new \Exception("Row is not set. Please set row before making the call.");
        }

        $cl = \CNIC\ClientFactory::getClient([
            "registrar" => "HEXONET",
        ]);
        if (self::$module->meta->sandbox == "true") {
            $cl->useOTESystem();
        }

        $cl->setCredentials(self::$module->meta->user, self::$module->meta->key)
            ->setReferer($_SERVER["HTTP_HOST"])
            ->setUserAgent("Blesta", BLESTA_VERSION, [
                "ispapi/" . self::$ispapiInstance->getVersion(),
            ])
            ->enableDebugMode() // activate logging
            ->setCustomLogger(new \BlestaLogger(
                self::$module->module_id,
                $cl->getURL()
            ));
        if (!empty(self::$module->ProxyServer)) {
            $cl->setProxy(self::$module->ProxyServer);
        }
        $r = $cl->request($command)->getHash();
        if (!preg_match("/^SetEnvironment$/", $command["COMMAND"]) && !preg_match($successCase, $r["CODE"])) {
            return [
                "success" => false,
                "CODE" => $r["CODE"],
                "error" => $r["CODE"] . " " . $r["DESCRIPTION"],
            ];
        }
        return $r;
    }
}
