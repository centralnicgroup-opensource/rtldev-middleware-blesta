<?php

/**
 * Test bootstrap.
 *
 * The module classes are written against Blesta's runtime, which is not
 * available here, so the few globals they touch are stubbed. Only pure logic is
 * covered by this suite - anything that needs a real Blesta or a live API is out
 * of scope and belongs in an integration run against the dev container.
 */

declare(strict_types=1);

if (!defined('DS')) {
    define('DS', DIRECTORY_SEPARATOR);
}

/** Minimal stand-in for Blesta's Configure. */
class Configure
{
    private static array $values = ['Caching.on' => false, 'Blesta.company_id' => 1];

    public static function get(string $key): mixed
    {
        return self::$values[$key] ?? null;
    }

    public static function set(string $key, mixed $value): void
    {
        self::$values[$key] = $value;
    }

    public static function load(string $file, ?string $path = null): void
    {
    }
}

/** Minimal stand-in for Blesta's Cache. Caching is off in tests. */
class Cache
{
    public static function fetchCache(string $name, string $path = ''): mixed
    {
        return false;
    }

    public static function writeCache(string $name, string $value, $ttl = null, string $path = ''): void
    {
    }

    public static function clearCache(string $name, string $path = ''): void
    {
    }
}

/** Minimal stand-in for Blesta's Language. Returns the key so assertions stay stable. */
class Language
{
    public static function _(string $key, bool $return = false, ...$args): string
    {
        return $key;
    }
}

require_once __DIR__ . '/../apis/vendor/autoload.php';
require_once __DIR__ . '/../lib/base.php';
require_once __DIR__ . '/../lib/helper.php';
require_once __DIR__ . '/../lib/enums.php';
require_once __DIR__ . '/../lib/settings.php';
require_once __DIR__ . '/../lib/zone_info.php';
require_once __DIR__ . '/../lib/domain_manager.php';
