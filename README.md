# Blesta Integration

[![Latest Release](https://img.shields.io/github/v/release/centralnicgroup-opensource/rtldev-middleware-blesta)](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/releases)
[![Tests](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/actions/workflows/test.yml)
[![semantic-release](https://img.shields.io/badge/  📦🚀-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![GitHub Closed Issues](https://img.shields.io/github/issues-closed/centralnicgroup-opensource/rtldev-middleware-blesta)](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/issues?q=is:issue+is:closed)
[![Contributors](https://img.shields.io/github/contributors/centralnicgroup-opensource/rtldev-middleware-blesta)](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/graphs/contributors)
[![GitHub Stars](https://img.shields.io/github/stars/centralnicgroup-opensource/rtldev-middleware-blesta)](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/stargazers)

Registrar module for **Blesta 6**, letting you sell and manage domains across more than 1,000 TLDs through the CentralNic Reseller API — from the same admin and client area your customers already use.

---

## Contents

- [Key Features](#key-features)
- [Registrar Module](#registrar-module)
  - [Installation](#installation)
  - [Account Settings](#account-settings)
- [Selling Domains](#selling-domains)
- [Managing Domains](#managing-domains)
- [What's New](#whats-new)
- [Resources](#resources)
- [Support](#support)
- [Maintainers](#maintainers)
- [License](#license)

---

## Key Features

- **All-in-one, inside Blesta** — Domains, DNS, DNSSEC and contacts are managed from the Blesta admin and client area, with no separate control panel to learn.
- **Fewer failed orders** — Terms are read per registry and orders are validated before they reach an invoice, so a customer cannot buy a period the registry will refuse.
- **Self-service DNS & DNSSEC** — Customers manage their own records and DNSSEC keys from the client area, on the tabs you choose to enable.
- **TLD-aware** — Registry-specific additional fields, IDN support and per-TLD feature detection, so demanding TLDs go through the first time.

---

## Registrar Module

| Brand               | Blesta Module ID | Status                                                           | Download                                                                                                                                  | Docs                                                                                                                              |
| ------------------- | ---------------- | ---------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| CentralNic Reseller | `cnr`            | ![maintained](https://img.shields.io/badge/MAINTAINED-green.svg) | [📦 Download](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/raw/refs/heads/main/blesta-cnr-registrar-latest.zip) | [📘 Docs](https://support.centralnicreseller.com/hc/en-gb/articles/21607819808285-Blesta-Module-Installation-Upgrade-Coming-soon) |

[**Download the latest module →**](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/raw/refs/heads/main/blesta-cnr-registrar-latest.zip)

### Installation

Extract the archive over your Blesta root, so the resulting path is `components/modules/cnr`. If extracted elsewhere, Blesta will not detect the module.

Then go to **Settings → Company → Modules → Available**, install **CentralNic Reseller**, and add an account with your API credentials.

Requires **PHP 8.3+** with `ext-intl`, and **Blesta 6**. The API client is bundled — there is nothing to install with Composer.

### Account Settings

| Setting                        | Description                                                         |
| ------------------------------ | ------------------------------------------------------------------- |
| **User / Password**            | Your CentralNic Reseller API credentials.                           |
| **Sandbox**                    | Point the account at the OT&E environment, where nothing is billed. |
| **DNSSEC Management**          | Show the DNSSEC tab to staff and customers.                         |
| **Proxy Server**               | Route API calls through an HTTP proxy.                              |
| **DNS Management Nameservers** | The delegation applied when a customer enables managed DNS.         |
| **Default DNS Record TTL**     | Applied to records created without one.                             |

---

## Selling Domains

| Feature               | Description                                                                    |
| --------------------- | ------------------------------------------------------------------------------ |
| **Registrations**     | New registrations, offered only for the terms each registry actually allows.   |
| **Transfers**         | Including auth codes where the registry requires one, such as `.nz` and `.fi`. |
| **Renewals**          | Manual and automatic, from the admin panel or on the billing cycle.            |
| **TLD Import**        | Pull the TLD catalogue into Blesta's Domain Manager.                           |
| **TLD Pricing**       | Import and synchronise registration, renewal and transfer prices.              |
| **Additional Fields** | Registry-specific data collected at order time, per TLD.                       |

---

## Managing Domains

| Feature              | Description                                                                      |
| -------------------- | -------------------------------------------------------------------------------- |
| **Nameservers**      | Set the delegation, or fall back to the managed DNS defaults.                    |
| **Nameserver Hosts** | Create and manage glue records on your own domains.                              |
| **WHOIS Contacts**   | Update registrant, administrative, technical and billing contacts.               |
| **Registrar Lock**   | Prevent unauthorised transfers away.                                             |
| **EPP Code**         | Retrieve the auth code needed to transfer a domain out.                          |
| **DNS Management**   | A, AAAA, CNAME, MX, MXE, TXT, SRV and NS records, plus URL and frame forwarding. |
| **Email Forwarding** | Forward addresses on a domain to existing mailboxes.                             |
| **ID Protection**    | Hide registrant details in public WHOIS, where the registry supports it.         |
| **DNSSEC**           | Manage DS and key records.                                                       |

Each appears as a tab on the service, for staff and for the customer, and is shown only when the TLD supports it and the customer has bought it.

---

## What's New

- **Correct terms for every TLD.** Registration, renewal and transfer periods are read per zone, so a customer can no longer buy a term the registry will refuse. `.no` is one year only, `.com.ai` starts at two, `.ac.cr` registers for up to ten years but renews one at a time.
- **DNS management works for every record type.** Adding an A, AAAA, MX, TXT, CNAME, SRV or NS record previously failed outright.
- **Orders are checked before they are invoiced.** A malformed domain or nameserver is rejected at the order form instead of after the customer has paid.
- **TLD price synchronisation completes.** It could previously stop partway without any sign of failure, leaving prices stale.
- **Domains can be added from the admin area again.** Add Service showed no domain field at all.
- **Proxy, managed DNS nameservers and record TTL** are configurable per account.
- **The module logo follows the light and dark themes.**

See the [changelog](CHANGELOG.md) for the full history.

---

## Resources

- [📘 Module documentation](https://support.centralnicreseller.com/hc/en-gb/articles/21607819808285-Blesta-Module-Installation-Upgrade-Coming-soon)
- [📝 Release notes](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/releases)
- [🛠 Contributing and running the tests](DEVELOPMENT.md)

## Support

Found a bug or missing a feature? [Open an issue](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/issues). For account or registry questions, contact [CentralNic Reseller support](https://support.centralnicreseller.com/).

## Maintainers

- **Kai Schwarz** — _Team Lead_ — [KaiSchwarz-cnic](https://github.com/kaischwarz-cnic)
- **Asif Nawaz** — _Development_ — [AsifNawaz-cnic](https://github.com/asifnawaz-cnic)

## License

MIT — see [LICENSE](LICENSE). For more information, visit [CentralNic Reseller, Team Internet Group PLC](https://www.centralnicreseller.com).
