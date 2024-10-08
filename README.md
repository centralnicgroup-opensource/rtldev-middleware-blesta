# Blesta "CentralNic Reseller" Registrar Module

[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![Build Status](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/workflows/Release/badge.svg?branch=master)](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/workflows/Release/badge.svg?branch=master)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/hexonet/php-sdk/blob/master/CONTRIBUTING.md)

This repository contains the Blesta Registrar Module for CentralNic Reseller, offering a comprehensive suite of features for efficient domain management and sales. 

#### Key / Additional Features:

- **Domain Registrations**: Supports new domain registrations through a streamlined interface.
- **Domain Transfers**: Facilitates domain transfers, including handling auth code requirements for specific TLDs such as .nz and .fi.
- **Domain Renewals**: Supports both manual and automatic domain renewals via the Blesta admin panel for increased flexibility.
- **Registrar Lock**: Provides the ability to enable a registrar lock to prevent unauthorized domain transfers.
- **Custom Nameservers & Nameserver Management**: Allows easy management and setup of custom nameservers.
- **WHOIS Contact Updates**: Supports updating Whois contact information for registered domains.
- **Get EPP Code**: Offers retrieval of EPP (authorization) codes required for domain transfers.
- **Additional Domain Fields**: Supports additional domain-specific fields required by certain TLDs.
- **TLD Import**: Automates the import of TLDs to streamline domain setup and management.
- **TLD Pricing**: Supports importing TLD pricing lists for efficient pricing management.

#### Supported Add-Ons:

- **DNS Management**: Provides comprehensive DNS management, including adding, updating, and deleting DNS records.
- **Email Forwarding**: Enables the configuration of email forwarding services for domains.
- **ID Protection**: Offers ID protection for domains to safeguard personal information associated with registrations.
- **DNSSEC Management**: Integrates DNSSEC to improve domain security by enabling DNS Security Extensions.
- **Custom Nameservers**: Allows users to set up and manage custom nameserver hosts for their domains.

## Resources

To get started, download the latest version of the CentralNic Reseller (CNR) module and refer to the documentation for installation and usage instructions:

- [Download ZIP Archive](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/raw/master/blesta-cnr-registrar-latest.zip)
- [Blesta Module Documentation](https://support.centralnicreseller.com/hc/en-gb/articles/21607819808285-Blesta-Module-Installation-Upgrade-Coming-soon)
- [Release Notes](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/releases)

## Deprecated Module: Blesta 'Hexonet' Registrar Module

**Important:** The Hexonet registrar module has been **deprecated** and will no longer receive new features. Future patches will be implemented only upon customer requests. You can still download earlier versions (up to 3.7.0) if needed.

### Download Options
- Access earlier versions of the Hexonet module on the [Releases Page](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/releases).
- Download the latest available version directly: [Hexonet Registrar Module v3.7.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/blob/master/blesta-ispapi-registrar-latest.zip).

### Recommendation
For new installations or updates, we recommend transitioning to the CentralNic Reseller registrar module for improved support and features. 

**Note:** The CentralNic Reseller registrar module is not a direct replacement for the Hexonet registrar module; however, it includes many of the features you value. For more details on the migration process, please check the [Hexonet to CentralNic Reseller Migration Guide](https://hexonet.net/migration-to-centralnic-reseller).

## Authors

- **Kai Schwarz** - _Team Lead_ - [KaiSchwarz-cnic](https://github.com/kaischwarz-cnic)
- **Asif Nawaz** - _Development_ - [AsifNawaz-cnic](https://github.com/asifnawaz-cnic)

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/blob/master/LICENSE) file for details.

For more information, visit [CentralNic Reseller, Team Internet Group PLC](https://www.centralnicreseller.com).
