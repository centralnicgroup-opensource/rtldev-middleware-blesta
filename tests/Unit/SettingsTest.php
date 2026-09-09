<?php

declare(strict_types=1);

use PHPUnit\Framework\Attributes\DataProvider;
use PHPUnit\Framework\TestCase;

/**
 * Blesta stores every module row value as a string, and two of these settings
 * previously had no field at all: the proxy was read from a property that was
 * never set, and the DNS record TTL was written inline as 3600.
 */
final class SettingsTest extends TestCase
{
    private function row(array $meta): stdClass
    {
        $row = new stdClass();
        $row->meta = (object) $meta;

        return $row;
    }

    public function testReadsCredentialsAndDecodesTheStringBooleans(): void
    {
        $s = CnrModuleSettings::fromRow($this->row([
            'user' => 'qmtest', 'key' => 'secret', 'sandbox' => 'true', 'dnssec' => 'false',
        ]));

        $this->assertSame('qmtest', $s->user);
        $this->assertSame('secret', $s->key);
        $this->assertTrue($s->sandbox);
        $this->assertFalse($s->dnssec);
    }

    public function testAnAbsentRowStillYieldsUsableDefaults(): void
    {
        $s = CnrModuleSettings::fromRow(null);

        $this->assertSame('', $s->proxyServer);
        $this->assertSame(CnrModuleSettings::DEFAULT_DNS_NAMESERVERS, $s->dnsNameservers);
        $this->assertSame(3600, $s->defaultTtl);
        $this->assertFalse($s->sandbox);
    }

    public static function nameserverProvider(): array
    {
        return [
            'blank falls back'   => ['', CnrModuleSettings::DEFAULT_DNS_NAMESERVERS],
            'spaces fall back'   => ['   ', CnrModuleSettings::DEFAULT_DNS_NAMESERVERS],
            'single host'        => ['ns1.example.net', ['ns1.example.net']],
            'trimmed and folded' => [' NS1.Example.NET , ns2.example.net ', ['ns1.example.net', 'ns2.example.net']],
            'empty entries drop' => ['ns1.example.net,,ns2.example.net,', ['ns1.example.net', 'ns2.example.net']],
        ];
    }

    #[DataProvider('nameserverProvider')]
    public function testNameserverListParsing(string $input, array $expected): void
    {
        $this->assertSame($expected, CnrModuleSettings::parseNameservers($input));
    }

    public static function ttlProvider(): array
    {
        return [
            'configured'     => ['7200', 7200],
            'blank'          => ['', 3600],
            'zero'           => ['0', 3600],
            'negative'       => ['-1', 3600],
            'not a number'   => ['soon', 3600],
            'null'           => [null, 3600],
        ];
    }

    #[DataProvider('ttlProvider')]
    public function testTtlParsing(mixed $input, int $expected): void
    {
        $this->assertSame($expected, CnrModuleSettings::parseTtl($input));
    }

    public static function nameserverValidationProvider(): array
    {
        return [
            'blank is allowed'  => ['', true],
            'valid list'        => ['ns1.dnsres.net, ns2.dnsres.net', true],
            'single label'      => ['localhost', false],
            'trailing comma ok' => ['ns1.dnsres.net,', false],
            'not a host'        => ['ns1.dnsres.net, http://x', false],
        ];
    }

    #[DataProvider('nameserverValidationProvider')]
    public function testNameserverListValidation(string $input, bool $valid): void
    {
        $this->assertSame($valid, CnrHelper::validateNameserverList($input));
    }

    public function testAConfiguredTtlReachesTheZoneLine(): void
    {
        $record = ['hostname' => 'www', 'record_type' => 'A', 'address' => '1.2.3.4', 'priority' => '10'];

        $this->assertSame('www 3600 IN A 1.2.3.4', CnrHelper::getResourceRecord($record, 'example.com'));
        $this->assertSame('www 7200 IN A 1.2.3.4', CnrHelper::getResourceRecord($record, 'example.com', 7200));
    }
}
