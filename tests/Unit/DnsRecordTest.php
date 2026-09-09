<?php

declare(strict_types=1);

use PHPUnit\Framework\Attributes\DataProvider;
use PHPUnit\Framework\TestCase;

/**
 * Captures the command addDNS() would send instead of sending it.
 */
final class RecordingDomainManager extends CnrDomainManager
{
    /** @var array<string, mixed> */
    public array $sent = [];

    /**
     * @param array<string, mixed> $command
     * @return array<string, mixed>
     */
    public function call(array $command, string $successCase = "/^200$/"): array
    {
        $this->sent = $command;

        return ["CODE" => "200"];
    }
}

/**
 * addDNS() used to hand the result of getResourceRecord() straight to
 * array_key_exists(). That result is a string for every ordinary record type and
 * an array only for URL/FRAME, so adding an A, MX or TXT record raised a
 * TypeError, and an MXE record wrote the literal "Array" into ADDRR0.
 */
final class DnsRecordTest extends TestCase
{
    private function add(string $type, string $address, string $hostname = 'www'): array
    {
        $dm = new RecordingDomainManager();
        $dm->addDNS('example.com', [
            'hostname' => $hostname,
            'record_type' => $type,
            'address' => $address,
            'priority' => '10',
            'ttl' => '3600',
        ]);

        return $dm->sent;
    }

    public static function ordinaryRecordProvider(): array
    {
        return [
            'A'     => ['A', '1.2.3.4', 'www 3600 IN A 1.2.3.4'],
            'AAAA'  => ['AAAA', '::1', 'www 3600 IN AAAA ::1'],
            'MX'    => ['MX', 'mail.example.com', 'www 3600 IN MX 10 mail.example.com'],
            'TXT'   => ['TXT', 'v=spf1 -all', 'www 3600 IN TXT v=spf1 -all'],
            'CNAME' => ['CNAME', 'other.example.com', 'www 3600 IN CNAME other.example.com'],
            'NS'    => ['NS', 'ns1.example.com', 'www 3600 NS ns1.example.com'],
        ];
    }

    #[DataProvider('ordinaryRecordProvider')]
    public function testAnOrdinaryRecordBecomesOneZoneLine(string $type, string $address, string $line): void
    {
        $sent = $this->add($type, $address);

        $this->assertSame('ModifyDNSZone', $sent['COMMAND']);
        $this->assertSame('example.com', $sent['DNSZONE']);
        $this->assertSame($line, $sent['ADDRR0']);
        $this->assertArrayNotHasKey('ADDRR1', $sent);
    }

    public function testAnMxeRecordForAnIpExpandsToTwoNumberedLines(): void
    {
        $sent = $this->add('MXE', '1.2.3.4');

        $this->assertSame('ModifyDNSZone', $sent['COMMAND']);
        $this->assertStringContainsString('IN MX', $sent['ADDRR0']);
        $this->assertStringContainsString('IN A 1.2.3.4', $sent['ADDRR1']);
        // the defect wrote the array itself into a single ADDRR0
        $this->assertStringNotContainsString('Array', $sent['ADDRR0']);
    }

    public function testAForwardingRecordUsesTheWebForwardingCommand(): void
    {
        foreach (['URL' => 'RD', 'FRAME' => 'MRD'] as $type => $expected) {
            $sent = $this->add($type, 'https://example.org');

            $this->assertSame('AddWebFwd', $sent['COMMAND'], $type);
            $this->assertSame($expected, $sent['type'], $type);
            $this->assertSame('https://example.org', $sent['target'], $type);
        }
    }
}
