<?php

declare(strict_types=1);

/**
 * The kinds of price a TLD carries.
 *
 * The values are the array keys Blesta's pricing structures use, so they are
 * backed by the same strings that were previously written out by hand at every
 * site. Reading them from here means a mistyped key is a fatal at the point of
 * the typo rather than a silently missing price.
 */
enum CnrPriceType: string
{
    case Register = "register";
    case Renew = "renew";
    case Transfer = "transfer";
    case Redemption = "redemption";
    case Setup = "setup";

    /**
     * The types that carry a per-term price, in the order they are presented.
     *
     * Redemption and setup are excluded: redemption is a one off recovery fee
     * and setup is added on top of a registration rather than being a term of
     * its own.
     *
     * @return array<int, self>
     */
    public static function billableTerms(): array
    {
        return [self::Register, self::Transfer, self::Renew];
    }

    /**
     * Every type that may appear in a pricing structure.
     *
     * @return array<int, string>
     */
    public static function allValues(): array
    {
        return array_map(static fn(self $c): string => $c->value, self::cases());
    }

    /**
     * @return array<int, string>
     */
    public static function billableTermValues(): array
    {
        return array_map(static fn(self $c): string => $c->value, self::billableTerms());
    }
}

/**
 * Renewal modes accepted by the SetDomainRenewalMode command.
 *
 * A zone with no explicit renewal command is renewed by switching this mode
 * instead of sending RenewDomain with a period.
 */
enum CnrRenewalMode: string
{
    /** Follow the account default. */
    case DefaultMode = "DEFAULT";
    /** Renew once at expiry, then fall back to the default. */
    case RenewOnce = "RENEWONCE";
    /** Delete at expiry. */
    case AutoDelete = "AUTODELETE";
    /** Let the domain expire. */
    case AutoExpire = "AUTOEXPIRE";

    /**
     * Resolve a mode name, falling back to the account default when the value is
     * not one the API accepts.
     */
    public static function fromName(string $mode): self
    {
        return self::tryFrom(strtoupper(trim($mode))) ?? self::DefaultMode;
    }
}
