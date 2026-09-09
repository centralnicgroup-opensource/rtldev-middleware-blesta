<?php

declare(strict_types=1);

/**
 * Zone (TLD) configuration as returned by GetZoneInfo / QueryZoneInformationList.
 *
 * This is the structure the module sells terms from, so it is a typed object
 * rather than a decoded array: reading a property that does not exist is a hard
 * error here, where on a plain object it would quietly be null. That matters
 * because a null period list reads downstream as "no restriction", which is how
 * a term the registry refuses ends up on an invoice.
 *
 * Instances are built by fromApi() when the registry is queried and by
 * fromCache() when the cached copy is used, so both paths are guaranteed to
 * produce the same shape.
 */
final class CnrZoneInfo
{
    use CnrRejectsUnknownProperties;

    public function __construct(
        public readonly CnrZoneTld $tld,
        public readonly CnrZonePeriods $registration,
        public readonly CnrZoneRenewal $renewal,
        public readonly CnrZoneTransfer $transfer,
        public readonly CnrZoneTrade $trade,
        public readonly CnrZoneAddons $addons
    ) {
    }

    /**
     * Build from one row of an API response.
     *
     * GetZoneInfo returns a single row at index 0, QueryZoneInformationList one
     * row per requested zone, so the row index is passed in rather than assumed.
     *
     * @param array<string, array<int, string>> $props Response properties
     * @param int $idx Index of the row to read
     * @param string $tld TLD the row describes, without a leading dot
     * @param string $domain A domain of that TLD, for the TLD specific checks
     */
    public static function fromApi(array $props, int $idx, string $tld, string $domain): self
    {
        $col = static fn(string $name): string => (string) ($props[$name][$idx] ?? "");
        $flag = static fn(string $name): bool => (int) ($props[$name][$idx] ?? 0) === 1;

        $supportsExplicitRenewal = $flag("RRPSUPPORTSRENEWAL");

        $registrationPeriods = CnrHelper::parsePeriods($col("REGISTRATIONPERIODS"));
        $transferPeriods = CnrHelper::parsePeriods($col("TRANSFERPERIODS"));

        // Renewal periods fall back to a single year in two cases:
        //  - the registry offers no explicit renewal command for this zone;
        //    renewals go through SetDomainRenewalMode and are one year at a time
        //  - the zone does support explicit renewal but reports no renewal terms
        //    ("n/a" or absent, as .com.vu and .net.vu do)
        // Both must produce [1] rather than an empty list, which would read as
        // "no restriction" and allow a term that cannot be renewed.
        $renewalPeriods = CnrHelper::parsePeriods($col("RENEWALPERIODS"));
        if (!$supportsExplicitRenewal || empty($renewalPeriods)) {
            $renewalPeriods = [1];
        }

        $contactsForTransfer = [];
        foreach (explode(",", $col("TRANSFERSUPPORTEDCONTACTS")) as $contact) {
            if ($contact !== "") {
                $contactsForTransfer[] = "{$contact}CONTACT";
            }
        }

        $renewsOnTransfer = !empty($props["RENEWALATTRANSFER"][$idx])
            || !empty($props["RENEWALAFTERTRANSFER"][$idx]);
        $graceDays = (int) ($props["AUTORENEWGRACEPERIODDAYS"][$idx] ?? 0);

        return new self(
            new CnrZoneTld(
                label: "." . $tld,
                class: $col("ZONE") !== "" ? $col("ZONE") : $tld,
                isAFNIC: (bool) preg_match("/\.(fr|pm|re|tf|wf|yt)$/i", $domain),
                isNTLD: $flag("ISNTLD"),
                dnssec_dsdata: $flag("SUPPORTSDNSSECDSDATA"),
                categories: explode(",", $col("NTLDCATEGORIES")),
                periods: CnrHelper::parsePeriods($col("PERIODS")),
                redemptionDays: (int) ($props["REDEMPTIONPERIODDAYS"][$idx] ?? 0),
                graceDays: $graceDays,
                unlockWithAuthCode: (bool) preg_match("/\.fi$/i", $domain),
                updated_at: date("Y-m-d H:i:s")
            ),
            new CnrZonePeriods($registrationPeriods),
            new CnrZoneRenewal(
                periods: $renewalPeriods,
                renewalMode: $col("RENEWALMODE") !== "" ? $col("RENEWALMODE") : "DEFAULT",
                supportsRenewal: $supportsExplicitRenewal,
                paymentPeriod: $graceDays
            ),
            new CnrZoneTransfer(
                periods: $transferPeriods,
                supportsTransferLock: $flag("SUPPORTSTRANSFERLOCKS"),
                supportsPreCheck: $flag("FOAEMAIL") || $col("AUTHCODE") === "required",
                resetsRegistrationPeriod: $flag("TRANSFERRESETSREGISTRATIONPERIOD"),
                isFree: !$renewsOnTransfer,
                contacts: $contactsForTransfer,
                requiresAuthCode: $renewsOnTransfer
            ),
            new CnrZoneTrade(
                required: $col("OWNERCHANGEPROCESS") === "TRADE",
                isIRTP: $flag("IRTP")
            ),
            new CnrZoneAddons(
                IDProtection: !empty($props["RRPSUPPORTSWHOISPRIVACY"][$idx])
                    || !empty($props["SUPPORTSTRUSTEE"][$idx])
            )
        );
    }

    /**
     * Rebuild from the cached copy written by toArray().
     *
     * @param object|array<string, mixed> $cached
     */
    public static function fromCache(object|array $cached): self
    {
        /** @var array<string, array<string, mixed>> $c */
        $c = json_decode(json_encode($cached) ?: "[]", true) ?: [];
        $tld = $c["tld"] ?? [];

        return new self(
            new CnrZoneTld(
                label: (string) ($tld["label"] ?? ""),
                class: (string) ($tld["class"] ?? ""),
                isAFNIC: (bool) ($tld["isAFNIC"] ?? false),
                isNTLD: (bool) ($tld["isNTLD"] ?? false),
                dnssec_dsdata: (bool) ($tld["dnssec_dsdata"] ?? false),
                categories: (array) ($tld["categories"] ?? []),
                periods: (array) ($tld["periods"] ?? []),
                redemptionDays: (int) ($tld["redemptionDays"] ?? 0),
                graceDays: (int) ($tld["graceDays"] ?? 0),
                unlockWithAuthCode: (bool) ($tld["unlockWithAuthCode"] ?? false),
                updated_at: (string) ($tld["updated_at"] ?? "")
            ),
            new CnrZonePeriods((array) ($c["registration"]["periods"] ?? [])),
            new CnrZoneRenewal(
                periods: (array) ($c["renewal"]["periods"] ?? [1]),
                renewalMode: (string) ($c["renewal"]["renewalMode"] ?? "DEFAULT"),
                supportsRenewal: (bool) ($c["renewal"]["supportsRenewal"] ?? false),
                paymentPeriod: (int) ($c["renewal"]["paymentPeriod"] ?? 0)
            ),
            new CnrZoneTransfer(
                periods: (array) ($c["transfer"]["periods"] ?? []),
                supportsTransferLock: (bool) ($c["transfer"]["supportsTransferLock"] ?? false),
                supportsPreCheck: (bool) ($c["transfer"]["supportsPreCheck"] ?? false),
                resetsRegistrationPeriod: (bool) ($c["transfer"]["resetsRegistrationPeriod"] ?? false),
                isFree: (bool) ($c["transfer"]["isFree"] ?? false),
                contacts: (array) ($c["transfer"]["contacts"] ?? []),
                requiresAuthCode: (bool) ($c["transfer"]["requiresAuthCode"] ?? false)
            ),
            new CnrZoneTrade(
                required: (bool) ($c["trade"]["required"] ?? false),
                isIRTP: (bool) ($c["trade"]["isIRTP"] ?? false)
            ),
            new CnrZoneAddons(
                IDProtection: (bool) ($c["addons"]["IDProtection"] ?? false)
            )
        );
    }

    /**
     * The cacheable form. Kept as plain data so the cache stays readable and
     * survives a change to these classes.
     *
     * @return array<string, mixed>
     */
    public function toArray(): array
    {
        return [
            "tld" => [
                "label" => $this->tld->label,
                "class" => $this->tld->class,
                "isAFNIC" => $this->tld->isAFNIC,
                "isNTLD" => $this->tld->isNTLD,
                "dnssec_dsdata" => $this->tld->dnssec_dsdata,
                "categories" => $this->tld->categories,
                "periods" => $this->tld->periods,
                "redemptionDays" => $this->tld->redemptionDays,
                "graceDays" => $this->tld->graceDays,
                "unlockWithAuthCode" => $this->tld->unlockWithAuthCode,
                "updated_at" => $this->tld->updated_at,
            ],
            "registration" => [
                "periods" => $this->registration->periods,
                "defaultPeriod" => $this->registration->defaultPeriod,
            ],
            "renewal" => [
                "periods" => $this->renewal->periods,
                "defaultPeriod" => $this->renewal->defaultPeriod,
                "renewalMode" => $this->renewal->renewalMode,
                "supportsRenewal" => $this->renewal->supportsRenewal,
                "paymentPeriod" => $this->renewal->paymentPeriod,
            ],
            "transfer" => [
                "periods" => $this->transfer->periods,
                "supportsTransferLock" => $this->transfer->supportsTransferLock,
                "supportsPreCheck" => $this->transfer->supportsPreCheck,
                "resetsRegistrationPeriod" => $this->transfer->resetsRegistrationPeriod,
                "defaultPeriod" => $this->transfer->defaultPeriod,
                "isFree" => $this->transfer->isFree,
                "includeContacts" => $this->transfer->includeContacts,
                "contacts" => $this->transfer->contacts,
                "requiresAuthCode" => $this->transfer->requiresAuthCode,
            ],
            "trade" => [
                "required" => $this->trade->required,
                "isStandard" => $this->trade->isStandard,
                "isIRTP" => $this->trade->isIRTP,
                "triggerFields" => $this->trade->triggerFields,
            ],
            "addons" => [
                "IDProtection" => $this->addons->IDProtection,
            ],
        ];
    }
}

/**
 * A list of whole year terms, with the shortest one as the default.
 */
class CnrZonePeriods
{
    use CnrRejectsUnknownProperties;

    public readonly int $defaultPeriod;

    /** @param array<int, int> $periods */
    public function __construct(public readonly array $periods)
    {
        $this->defaultPeriod = $periods[0] ?? -1;
    }

    public function allows(int $term): bool
    {
        return in_array($term, $this->periods, true);
    }
}

/**
 * Zone level facts about the TLD itself.
 */
final class CnrZoneTld
{
    use CnrRejectsUnknownProperties;

    /**
     * @param array<int, string> $categories
     * @param array<int, int> $periods
     */
    public function __construct(
        public readonly string $label,
        public readonly string $class,
        public readonly bool $isAFNIC,
        public readonly bool $isNTLD,
        public readonly bool $dnssec_dsdata,
        public readonly array $categories,
        public readonly array $periods,
        public readonly int $redemptionDays,
        public readonly int $graceDays,
        public readonly bool $unlockWithAuthCode,
        public readonly string $updated_at,
        public readonly mixed $repository = null
    ) {
    }
}

/**
 * How a zone is renewed.
 *
 * Two registries behave differently here and the difference decides which
 * command is sent: a zone with explicit renewal takes RenewDomain with a PERIOD,
 * one without is renewed by switching the renewal mode with SetDomainRenewalMode
 * and always advances a single year.
 */
final class CnrZoneRenewal extends CnrZonePeriods
{
    /** @param array<int, int> $periods */
    public function __construct(
        array $periods,
        public readonly string $renewalMode,
        public readonly bool $supportsRenewal,
        public readonly int $paymentPeriod
    ) {
        parent::__construct($periods);
    }

    /**
     * True when the zone has no explicit renewal command and has to be renewed
     * by setting its renewal mode instead.
     */
    public function requiresRenewalModeFallback(): bool
    {
        return !$this->supportsRenewal;
    }
}

/**
 * How a zone is transferred.
 */
final class CnrZoneTransfer extends CnrZonePeriods
{
    public readonly bool $includeContacts;

    /**
     * @param array<int, int> $periods
     * @param array<int, string> $contacts
     */
    public function __construct(
        array $periods,
        public readonly bool $supportsTransferLock,
        public readonly bool $supportsPreCheck,
        public readonly bool $resetsRegistrationPeriod,
        public readonly bool $isFree,
        public readonly array $contacts,
        public readonly bool $requiresAuthCode
    ) {
        parent::__construct($periods);
        $this->includeContacts = !empty($contacts);
    }
}

/**
 * Owner change handling for the zone.
 */
final class CnrZoneTrade
{
    use CnrRejectsUnknownProperties;

    /** @var array<string, array<int, string>> */
    public readonly array $triggerFields;

    public function __construct(
        public readonly bool $required,
        public readonly bool $isIRTP,
        public readonly bool $isStandard = true
    ) {
        $this->triggerFields = [
            "Registrant" => ["First Name", "Last Name", "Organization Name", "Email"],
        ];
    }
}

/**
 * Optional services the zone supports.
 */
final class CnrZoneAddons
{
    use CnrRejectsUnknownProperties;

    public function __construct(public readonly bool $IDProtection)
    {
    }
}

/**
 * Turns a mistyped property into a hard error.
 *
 * PHP only warns when an undefined property is read, and a warning is easy to
 * miss: downstream an unexpected null reads as "no value set", which for a
 * period list means "no restriction". Failing loudly here keeps a typo from
 * quietly widening what can be sold.
 */
trait CnrRejectsUnknownProperties
{
    public function __get(string $name): never
    {
        throw new InvalidArgumentException(
            static::class . " has no property \"{$name}\""
        );
    }

    public function __isset(string $name): bool
    {
        return false;
    }
}
