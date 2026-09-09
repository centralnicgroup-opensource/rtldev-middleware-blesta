<?php

declare(strict_types=1);

use PHPUnit\Framework\Attributes\DataProvider;
use PHPUnit\Framework\TestCase;

/**
 * Covers how a GetZoneInfo response becomes the zone structure the module sells
 * terms from.
 *
 * The fixtures in tests/fixtures/zoneinfo.json are real API responses, trimmed to
 * the columns the builder reads. They are here because getting these wrong sells
 * a term the registry will refuse - the module once returned identical periods
 * for every TLD in the catalogue, and nothing caught it.
 */
final class ZoneDataTest extends TestCase
{
    /** @var array<string, array<string, array<int, string>>> */
    private static array $fixtures;

    public static function setUpBeforeClass(): void
    {
        self::$fixtures = json_decode(
            (string) file_get_contents(__DIR__ . '/../fixtures/zoneinfo.json'),
            true
        );
    }

    private function build(string $tld): object
    {
        $method = new ReflectionMethod(CnrDomainManager::class, 'buildZoneData');
        $method->setAccessible(true);

        return $method->invoke(
            new CnrDomainManager(),
            self::$fixtures[$tld],
            0,
            $tld,
            "example.{$tld}"
        );
    }

    public static function periodProvider(): array
    {
        // tld => [registration, renewal, transfer]
        return [
            // one year only at the registry, in every direction
            'no'      => ['no',      [1], [1], [1]],
            'com'     => ['com',     [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [1]],
            // .ai carries a two year minimum and renews at most nine
            'com.ai'  => ['com.ai',  [2, 3, 4, 5, 6, 7, 8, 9, 10], [2, 3, 4, 5, 6, 7, 8, 9], [2]],
            // registers up to ten years but renews one at a time
            'ac.cr'   => ['ac.cr',   [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [1], []],
            'aaa.pro' => ['aaa.pro', [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1]],
            // reports no explicit renewal at all, so renewal falls back to one
            // year; transfers are "n/a", which is an empty list, not a zero term
            'com.vu'  => ['com.vu',  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [1], []],
        ];
    }

    #[DataProvider('periodProvider')]
    public function testPeriodsAreReadPerZone(string $tld, array $reg, array $renew, array $transfer): void
    {
        $zone = $this->build($tld);

        $this->assertSame($reg, $zone->registration->periods, "registration periods for .{$tld}");
        $this->assertSame($renew, $zone->renewal->periods, "renewal periods for .{$tld}");
        $this->assertSame($transfer, $zone->transfer->periods, "transfer periods for .{$tld}");
    }

    public function testZonesDoNotAllShareTheSamePeriods(): void
    {
        $signatures = [];
        foreach (array_keys(self::$fixtures) as $tld) {
            $z = $this->build($tld);
            $signatures[] = json_encode([
                $z->registration->periods, $z->renewal->periods, $z->transfer->periods,
            ]);
        }

        // The original defect applied one zone's response to every TLD, which
        // collapsed the whole catalogue to a single signature.
        $this->assertGreaterThan(
            1,
            count(array_unique($signatures)),
            'every zone produced identical periods, which is the bulk overwrite defect'
        );
    }

    public function testRenewalNeverComesBackEmpty(): void
    {
        // An empty renewal list reads as "no restriction" downstream, which would
        // let a ten year term be sold on a zone that renews one year at a time.
        foreach (array_keys(self::$fixtures) as $tld) {
            $this->assertNotEmpty($this->build($tld)->renewal->periods, ".{$tld} renewal periods");
        }
    }

    public function testLabelAndClassAreSetPerTld(): void
    {
        $zone = $this->build('com.ai');
        $this->assertSame('.com.ai', $zone->tld->label);
        // several registerable suffixes share one zone, so the class is the zone
        // itself. The API is not consistent about its case, so compare folded.
        $this->assertSame('ai', strtolower((string) $zone->tld->class));
    }

    public function testAMistypedPropertyIsAHardErrorRatherThanNull(): void
    {
        $zone = $this->build('no');

        // A silent null here would read downstream as "no restriction", which is
        // how a term the registry refuses reaches an invoice.
        $this->expectException(InvalidArgumentException::class);
        $zone->renewal->period;
    }

    public function testTheStructureCannotBeMutatedAfterConstruction(): void
    {
        $zone = $this->build('no');

        $this->expectException(Error::class);
        $zone->renewal->supportsRenewal = true;
    }

    public function testACachedCopyRebuildsToTheSameValues(): void
    {
        $zone = $this->build('com.ai');
        $rebuilt = CnrZoneInfo::fromCache($zone->toArray());

        $this->assertSame($zone->registration->periods, $rebuilt->registration->periods);
        $this->assertSame($zone->renewal->periods, $rebuilt->renewal->periods);
        $this->assertSame($zone->transfer->periods, $rebuilt->transfer->periods);
        $this->assertSame($zone->renewal->supportsRenewal, $rebuilt->renewal->supportsRenewal);
        $this->assertSame($zone->tld->label, $rebuilt->tld->label);
    }

    public function testZonesWithoutExplicitRenewalAreFlaggedForTheRenewalModeFallback(): void
    {
        // .com.vu has no explicit renewal command, so it is renewed by switching
        // the renewal mode instead of sending RenewDomain with a period.
        $this->assertTrue($this->build('com.vu')->renewal->requiresRenewalModeFallback());
        $this->assertFalse($this->build('com')->renewal->requiresRenewalModeFallback());
    }

    public function testStructureSurvivesCachingBeingDisabled(): void
    {
        Configure::set('Caching.on', false);
        $zone = $this->build('no');
        $this->assertIsObject($zone, 'the builder must not hand back false when the cache is off');
        $this->assertIsObject($zone->renewal);
    }
}
