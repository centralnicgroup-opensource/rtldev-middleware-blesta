<?php

declare(strict_types=1);

use PHPUnit\Framework\TestCase;

final class EnumsTest extends TestCase
{
    public function testPriceTypeValuesMatchTheKeysBlestaExpects(): void
    {
        $this->assertSame(
            ['register', 'renew', 'transfer', 'redemption', 'setup'],
            CnrPriceType::allValues()
        );
    }

    public function testOnlyRegisterTransferAndRenewCarryATerm(): void
    {
        // redemption is a one off recovery fee and setup is added on top of a
        // registration, so neither is a term of its own
        $this->assertSame(['register', 'transfer', 'renew'], CnrPriceType::billableTermValues());
    }

    public function testRenewalModeAcceptsTheApiValues(): void
    {
        $this->assertSame('RENEWONCE', CnrRenewalMode::fromName('RENEWONCE')->value);
        $this->assertSame('AUTOEXPIRE', CnrRenewalMode::fromName('autoexpire')->value);
        $this->assertSame('AUTODELETE', CnrRenewalMode::fromName(' AutoDelete ')->value);
    }

    public function testAnUnknownRenewalModeFallsBackToTheAccountDefault(): void
    {
        // the API rejects anything else, so an unrecognised mode must not be sent
        $this->assertSame('DEFAULT', CnrRenewalMode::fromName('nonsense')->value);
        $this->assertSame('DEFAULT', CnrRenewalMode::fromName('')->value);
    }
}
