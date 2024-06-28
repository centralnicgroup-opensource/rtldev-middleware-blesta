# Blesta "CentralNic Reseller" Registrar Module

[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![Build Status](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/workflows/Release/badge.svg?branch=master)](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/workflows/Release/badge.svg?branch=master)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/hexonet/php-sdk/blob/master/CONTRIBUTING.md)

This repository contains the Blesta Registrar Module for CentralNic Reseller, offering a comprehensive suite of features for efficient domain management and sales. 

## Features

- **Automated TLD Identification**: Streamlines setup by automatically identifying and configuring TLDs, reducing manual input.
- **Manual Renewals**: Provides the ability to manually renew domains directly from the Blesta admin panel, offering greater control and flexibility.
- **Domain Transfers**: Facilitates domain transfers with specific handling for TLDs requiring auth codes (e.g., .nz, .fi).
- **Nameserver Management**: Enhances nameserver management through user-friendly interfaces and improved stability.
- **Expiry Date Management**: Accurately manages domain expiry dates using the PHP Date format.
- **Enhanced Security and Stability**: Regular updates and patches to ensure security and operational stability.
- **DNS Management**: Comprehensive capabilities for adding, updating, and deleting DNS records.
- **Email Forwarding**: Supports configuration of email forwarding services for domains.
- **ID Protection**: Offers options for domain ID protection, including locking and auth code retrieval.
- **DNSSEC Support**: Integrates DNSSEC to enhance domain security.
- **Custom Nameservers**: Facilitates the setup and management of custom nameserver hosts.
- **TLD Pricing**: Supports importing TLD lists along with associated pricing.

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
