<?php

declare(strict_types=1);

use PHPUnit\Framework\Attributes\DataProvider;
use PHPUnit\Framework\TestCase;

/**
 * Covers the pure helpers. Every case here came from a real API response or a
 * real defect; the period cases in particular are the ones that decide which
 * terms a reseller can sell.
 */
final class CnrHelperTest extends TestCase
{
    public static function periodProvider(): array
    {
        return [
            'plain years'          => ['1Y,2Y,3Y,10Y', [1, 2, 3, 10]],
            'not applicable'       => ['n/a', []],
            'not applicable upper' => ['N/A', []],
            'empty'                => ['', []],
            // "3M" must never be read as three years
            'months are dropped'   => ['1M,1Y,3M', [1]],
            // reset periods are read as their plain equivalent
            'reset periods'        => ['R1Y,R2Y', [1, 2]],
            'zero year allowed'    => ['0Y,1Y', [0, 1]],
            // Blesta offers no term above ten years
            'capped at ten'        => ['1Y,11Y,12Y', [1]],
            'deduplicated'         => ['1Y,1Y,2Y', [1, 2]],
            'array input'          => [['1Y', '2Y'], [1, 2]],
            'whitespace tolerated' => [' 1Y , 2Y ', [1, 2]],
        ];
    }

    #[DataProvider('periodProvider')]
    public function testParsePeriods(array|string $input, array $expected): void
    {
        $this->assertSame($expected, CnrHelper::parsePeriods($input));
    }

    public static function resourceRecordProvider(): array
    {
        return [
            'A'     => ['A', 'www 3600 IN A 1.2.3.4'],
            'MX'    => ['MX', 'www 3600 IN MX 10 1.2.3.4'],
            'SRV'   => ['SRV', 'www 3600 IN SRV 10 1.2.3.4'],
            'NS'    => ['NS', 'www 3600 NS 1.2.3.4'],
            'TXT'   => ['TXT', 'www 3600 IN TXT 1.2.3.4'],
        ];
    }

    #[DataProvider('resourceRecordProvider')]
    public function testGetResourceRecordReturnsASingleZoneLine(string $type, string $expected): void
    {
        $record = [
            'hostname' => 'www', 'record_type' => $type,
            'address' => '1.2.3.4', 'priority' => '10', 'ttl' => '3600',
        ];
        $this->assertSame($expected, CnrHelper::getResourceRecord($record, 'example.com'));
    }

    public function testGetResourceRecordExpandsMxeToTwoLines(): void
    {
        $out = CnrHelper::getResourceRecord(
            ['hostname' => 'www', 'record_type' => 'MXE', 'address' => '1.2.3.4', 'priority' => '10', 'ttl' => '3600'],
            'example.com'
        );
        $this->assertIsArray($out);
        $this->assertCount(2, $out);
    }

    public function testGetResourceRecordFallsBackToADefaultTtl(): void
    {
        $out = CnrHelper::getResourceRecord(
            ['hostname' => 'www', 'record_type' => 'A', 'address' => '1.2.3.4', 'priority' => '10', 'ttl' => 'nonsense'],
            'example.com'
        );
        $this->assertSame('www 3600 IN A 1.2.3.4', $out);
    }

    public function testCastDateReadsApiTimestampsAsUtc(): void
    {
        $out = CnrHelper::castDate('2026-07-25 07:46:34');
        $this->assertSame(strtotime('2026-07-25T07:46:34Z'), $out['ts']);
        $this->assertSame('2026-07-25', $out['short']);
    }

    public function testGetExpiryDatePrefersTheEarlierRenewalDate(): void
    {
        $earlier = CnrHelper::getExpiryDate('2027-01-01 00:00:00', '2028-01-01 00:00:00', null);
        $this->assertSame(strtotime('2027-01-01T00:00:00Z'), $earlier);
    }

    public function testGetExpiryDateFallsBackToTheExpirationDate(): void
    {
        $this->assertSame(
            strtotime('2029-03-04T00:00:00Z'),
            CnrHelper::getExpiryDate(null, null, '2029-03-04 00:00:00')
        );
    }

    public function testGetSldTld(): void
    {
        $this->assertSame(['sld' => 'example', 'tld' => 'com'], CnrHelper::getSldTld('example.com'));
        $this->assertSame('com', CnrHelper::getSldTld('example.com', true));
    }

    public function testSupportedRecordTypesIncludeTheForwardingPseudoTypes(): void
    {
        $types = CnrHelper::getSupportedRRTypes();
        foreach (['A', 'MX', 'MXE', 'TXT', 'URL', 'FRAME'] as $t) {
            $this->assertContains($t, $types);
        }
    }

    public static function hostNameProvider(): array
    {
        return [
            // What an order form actually receives
            'plain domain'        => ['example.com', true],
            'nameserver'          => ['ns1.dnsres.net', true],
            'multi label tld'     => ['example.co.uk', true],
            'digits in label'     => ['ns1.host123.net', true],
            'hyphen inside'       => ['my-domain.com', true],
            'uppercase'           => ['Example.COM', true],
            'surrounding space'   => ['  example.com  ', true],
            // A nameserver need not be a subdomain; refusing this would block
            // a legal delegation.
            'two labels only'     => ['dnsres.net', true],
            // IDN reaches us in either form, in the label and in the TLD.
            // CNR sells punycode TLDs (xn--80asehdb, xn--e1a4c and the rest),
            // so a TLD rule of "letters only" would refuse every one of them.
            'unicode label'       => ['muller.de', true],
            'unicode accented'    => ['müller.de', true],
            'punycode label'      => ['xn--mller-kva.de', true],
            'punycode tld'        => ['example.xn--p1ai', true],
            'punycode both'       => ['xn--mller-kva.xn--p1ai', true],
            'unicode tld'         => ['example.рф', true],
            // Certain registry refusals
            'empty'               => ['', false],
            'null'                => [null, false],
            'single label'        => ['localhost', false],
            'trailing dot label'  => ['example.', false],
            'leading dot'         => ['.example.com', false],
            'double dot'          => ['a..b.com', false],
            'leading hyphen'      => ['-bad.com', false],
            'trailing hyphen'     => ['bad-.com', false],
            'numeric tld'         => ['example.123', false],
            'tld starts with dash'=> ['example.-com', false],
            'tld ends with dash'  => ['example.com-', false],
            'single char tld'     => ['example.c', false],
            'url not a host'      => ['http://example.com', false],
            'space inside'        => ['exa mple.com', false],
            'underscore'          => ['bad_ns.example.com', false],
            'ip address'          => ['192.0.2.1', false],
        ];
    }

    #[DataProvider('hostNameProvider')]
    public function testHostNameValidation(?string $input, bool $valid): void
    {
        $this->assertSame($valid, CnrHelper::isHostName($input));
    }

    public function testAnOverlongHostIsRejected(): void
    {
        $this->assertFalse(CnrHelper::isHostName(str_repeat('a.', 200) . 'com'));
    }
}
