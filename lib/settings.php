<?php

declare(strict_types=1);

/**
 * The settings held on a module row.
 *
 * Reading them through one object keeps the defaults in a single place. They
 * were previously either absent - the proxy setting had consuming code but no
 * field to fill it - or written inline at the point of use, which is how the
 * DNS record TTL came to be hard coded.
 */
final class CnrModuleSettings
{
    /** Nameservers that serve zones hosted on the registrar's managed DNS. */
    public const DEFAULT_DNS_NAMESERVERS = [
        "ns1.dnsres.net",
        "ns2.dnsres.net",
        "ns3.dnsres.net",
    ];

    public const DEFAULT_TTL = 3600;

    /** @param array<int, string> $dnsNameservers */
    public function __construct(
        public readonly string $user,
        public readonly string $key,
        public readonly bool $sandbox,
        public readonly bool $dnssec,
        public readonly string $proxyServer,
        public readonly array $dnsNameservers,
        public readonly int $defaultTtl
    ) {
    }

    /**
     * Read the settings off a module row.
     *
     * Blesta stores every meta value as a string, so "true"/"false" are decoded
     * here rather than at each call site.
     */
    public static function fromRow(?stdClass $row): self
    {
        $meta = $row->meta ?? new stdClass();

        return new self(
            user: (string) ($meta->user ?? ""),
            key: (string) ($meta->key ?? ""),
            sandbox: ($meta->sandbox ?? "false") === "true",
            dnssec: ($meta->dnssec ?? "false") === "true",
            proxyServer: trim((string) ($meta->proxy_server ?? "")),
            dnsNameservers: self::parseNameservers((string) ($meta->dns_nameservers ?? "")),
            defaultTtl: self::parseTtl($meta->default_ttl ?? null)
        );
    }

    /**
     * Split the comma separated nameserver list, falling back to the managed
     * DNS defaults when the field is blank.
     *
     * @return array<int, string>
     */
    public static function parseNameservers(string $value): array
    {
        $hosts = array_values(array_filter(array_map(
            static fn(string $host): string => strtolower(trim($host)),
            explode(",", $value)
        ), static fn(string $host): bool => $host !== ""));

        return $hosts ?: self::DEFAULT_DNS_NAMESERVERS;
    }

    /**
     * A TTL has to be a positive number of seconds; anything else falls back to
     * the default rather than reaching the registry as nonsense.
     */
    public static function parseTtl(mixed $value): int
    {
        return is_numeric($value) && (int) $value > 0
            ? (int) $value
            : self::DEFAULT_TTL;
    }
}
