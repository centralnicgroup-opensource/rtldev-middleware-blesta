# 6.1.0 (2026-09-11)

### Features

* **CentralNic Reseller Registrar Module:** correct TLD terms, DNS management & pre-payment order checks 

  Terms offered per TLD were wrong. Zone information was read once and
  applied to the whole catalogue, so every TLD advertised the same
  registration, renewal and transfer periods. Each zone is now read on its
  own: .no is one year only, .com.ai starts at two, .ac.cr registers for up
  to ten years but renews one at a time. Orders are checked against those
  terms, so a customer can no longer buy a period the registry will
  refuse. Where a TLD registers for longer than it renews, the renewable
  period wins, otherwise the sale succeeds and the first renewal fails.
  TLDs that report no renewal period at all, such as .com.vu, are no
  longer offered multi-year terms.

  DNS management works again. Adding an A, AAAA, MX, TXT, CNAME, SRV or NS
  record failed outright, and an MXE record pointing at an IP address
  reached the registry malformed. Only URL and FRAME forwarding worked.

  The daily TLD price synchronisation now completes. Three faults stopped
  it before its first API call, and a registry value that was not valid
  UTF-8 ended the run partway through, so prices could go stale without
  any sign of failure.

  Domain orders are checked before they are invoiced. An empty or
  malformed domain name, or a nameserver that is not a host name, is now
  rejected at the order form rather than after the customer has paid and
  the registration has failed. Transfer auth codes are not demanded,
  because not every registry uses one.

  Registering a domain from the admin area works again. Add Service showed
  no domain field at all, so a domain could only be added through the
  order form.

  New account settings: an optional proxy server, the nameservers used for
  managed DNS, and the default TTL for DNS records. The TTL was previously
  fixed at one hour and the proxy setting had no field to fill in.

  The module logo now follows the light and dark themes.

  Registry errors reach customers as readable messages rather than
  untranslated text, and additional domain fields for TLDs such as .ca
  keep their option labels.

  The repository now contains the module itself rather than the module
  inside a development checkout, matching the registrar modules Blesta
  ships. The tooling used to build and test it moved to a separate
  repository. The release archive is unchanged.

  The repository now contains the module itself rather than the module
  inside a development checkout, matching the registrar modules Blesta
  ships. The tooling used to build and test it moved to a separate
  repository. The release archive is unchanged.

  The suite that covers this ships with the module, so a fork can run it
  without anything else.

# 6.0.0 (2026-09-03)


### Bug Fixes

* **cnr registrar module:** add support for Blesta 6 


### BREAKING CHANGES

* **cnr registrar module:** The CNR Blesta Registrar Module now requires PHP 8.3.
Ensure your SYSTEM environment is updated to PHP 8.3 before upgrading, to
ensure compatibility and upgrade to our future releases hassle-free.

## 5.0.2 (2026-08-28)


### Bug Fixes

* **deps:** bump handlebars from 4.7.8 to 4.7.9 
* **deps:** bump lodash from 4.17.23 to 4.18.1 
* **deps:** bump lodash-es from 4.17.23 to 4.18.1 
* **deps:** pin gulp-composer's through2 below the ESM-only major 
* **deps:** rehome the shelljs override to pnpm-workspace.yaml 

## 5.0.1 (2025-11-24)


### Bug Fixes

* **deps:** update centralnic-reseller/php-sdk requirement 

# 5.0.0 (2025-02-12)


### Bug Fixes

* **deps:** bumped PHP-SDK to version from v9 to v11 


### BREAKING CHANGES

* **deps:** The CNR Blesta Registrar Module no longer supports PHP 7. Ensure your SYSTEM
environment is updated to PHP 8 to ensure compatibility and upgrade to our future releases
hassle-free.

## 4.2.6 (2025-01-20)


### Bug Fixes

* **cnr registrar module:** patch issue with Get EPP Codes functionality for DE, BE, EU, NO, CN TLDs 

## 4.2.5 (2024-11-19)


### Bug Fixes

* **cnr & ispapi module:** patches issue with domain registration/expiration date synchronisation 

## 4.2.4 (2024-11-08)


### Bug Fixes

* **cnic registrar module:** patched url forwarding bug and improved user experience 

## 4.2.3 (2024-11-07)


### Bug Fixes

* **hexonet registrar module:** patches issue with getRegistrationDate for domains 

## 4.2.2 (2024-10-18)


### Bug Fixes

* **cnr registrar module:** improved cache handling and tld pricing import fix 

## 4.2.1 (2024-10-18)


### Bug Fixes

* **cnr registrar module:** de and it additional fields patch 
* **cnr registrar module:** Transfer Domain additional fields patch, and .de and .it additional fields patch 

## 4.2.1 (2024-10-18)


### Bug Fixes

* **cnr registrar module:** de and it additional fields patch 

# 4.2.0 (2024-10-17)


### Features

* **cnr registrar module:** show account login connectivity status in the manage module section 

# 4.1.0 (2024-10-15)


### Features

* **CNR Registrar Module:** API-Driven domain additional fields with custom translations, also includes an patch which fixes the issue with TLD Pricing Import 

## 4.0.1 (2024-10-15)


### Bug Fixes

* **cnr registrar module:** patched an issue to avoid conflict with ispapi module 

# 4.0.0 (2024-09-25)


### Features

* **CentralNic Reseller:** Introduce Registrar Module 


### BREAKING CHANGES

* **CentralNic Reseller:** Deprecate HEXONET registrar module as of upcoming migration to the CentralNic Reseller (CNR) Platform and by that in favor of the CNR Module. We still offer the HEXONET/ispapi registrar module via ZIP File in master branch or via Readme / Release Overview.

# 3.7.0 (2024-06-24)


### Features

* **ispapi registrar module:** Add getRegistrationDate for Blesta 5.10.0 compatibility and bug fixes 

# 3.6.0 (2024-03-18)


### Features

* **hexonet registrar module:** Implemented DNSSEC feature integration along with additional module configuration. 

## 3.5.1 (2024-03-12)


### Performance Improvements

* **hexonet registrar module:** caching tld periods and addons data to improve performance 

# 3.5.0 (2024-03-11)


### Features

* **hexonet registrar module:** added custom nameserver hosts feature for domains 

## 3.4.1 (2024-03-07)


### Bug Fixes

* **hexonet registrar module:** Domain ID Protection and Whois Privacy fix 

# 3.4.0 (2024-03-07)


### Features

* **hexonet registrar module:** enhanced Experienced for ID Protection, Domain Lock and Auth Code 

# 3.3.0 (2024-3-6)


### Features

* **hexonet registrar module:** Added Email Forwarding Addon Feature 

## 3.2.1 (2024-3-5)


### Bug Fixes

* **hexonet registrar module:** fixed client area missing tab for DNS management 

# 3.2.0 (2024-3-4)


### Features

* **Hexonet Registrar Module:** Added DNS Management Addon Feature, Fixed Bugs, and Enhanced Performance 

## 3.1.2 (2024-2-26)


### Bug Fixes

* **hexonet blesta registrar module:** Patched an issue updating nameservers via the Manage Domains admin panel. 

## 3.1.1 (2024-2-21)


### Bug Fixes

* **blesta registrar module:** manual renewals fix via manage domain section in admin panel 

# 3.1.0 (2024-2-19)


### Features

* **tld import:** identify tlds fully automated, deprecate config setting 

## 3.0.13 (2024-2-19)


### Bug Fixes

* **blesta registrar module:** patch for missing period from Domain Renewals 

## 3.0.12 (2023-07-21)


### Bug Fixes

* **.nz, .fi:** review requesting auth 
* **.nz/.fi:** fix oversight with var name 

## 3.0.11 (2022-11-30)


### Bug Fixes

* **nameservers:** patched php issues in tab nameservers 

## 3.0.10 (2022-11-29)


### Bug Fixes

* **getexpirydate:** patch use of Date->format 

## 3.0.9 (2022-11-28)


### Bug Fixes

* **psr12:** cleaned dangling spaces 
* **registration/transfer:** patch index access error for nameservers 

## 3.0.8 (2022-11-24)


### Bug Fixes

* **archives:** add missing software dependency SDK 
* **php:** use php 7.4 in release process 

## 3.0.7 (2022-11-24)


### Bug Fixes

* **sdk:** includes missing php-sdk vendor files in this patch 

## 3.0.6 (2022-11-24)


### Bug Fixes

* **sdk:** upgrade sdk to version 8.0.4 (OTE connectivity fix) 

## 3.0.5 (2022-06-14)

### Bug Fixes

- **ci:** review build tool dependencies and test release process (no need to upgrade!) 

## 3.0.4 (2021-11-30)

### Bug Fixes

- **renewService:** fix PayDomainRenewal 

## 3.0.3 (2021-11-09)

### Bug Fixes

- **checkavailability:** minor review (no nxd, domain blocks) 

## 3.0.2 (2021-10-20)

### Bug Fixes

- **getAdminAddFields:** fix endless-loop 

## 3.0.1 (2021-08-12)

### Bug Fixes

- **build:** fixed archive file list globbing to fully including our SDKs source files 

# 3.0.0 (2021-08-10)

### Features

- **php-sdk:** migration to our API Connector 

### BREAKING CHANGES

- **php-sdk:** API Class Instantiation, Communication and Logging has been revamped from scratch.

## 2.0.3 (2021-08-06)

### Bug Fixes

- **gettlds:** order the list of TLDs more nicely 

## 2.0.2 (2021-08-05)

### Bug Fixes

- **ci:** include updated config.json in version commit 

## 2.0.1 (2021-08-05)

### Bug Fixes

- **gettlds:** fixed building list of supported TLDs 

# 2.0.0 (2021-08-05)

### Features

- **blesta 5.2:** initial revamp 

### BREAKING CHANGES

- **blesta 5.2:** Reviewed to be compatible with Blesta 5.2.

## 1.3.3 (2021-02-01)

### Bug Fixes

- **.my / .ae / .qa:** added requested TLDs (.my, .ae, .qa) - more to come , closes #86

## 1.3.2 (2021-01-27)

### Bug Fixes

- **ci:** migrated to gh actions and gulp; reviewed folder structure; 
- **github actions:** fixed archives; excluded vendor folder 

## 1.3.1 (2020-03-23)

### Bug Fixes

- **expiry-date:** expiry date auto-detection 

# 1.3.0 (2020-02-26)

### Features

- **transfer:** auto-detection for 0Y period, Transfer domain checks 

## 1.2.2 (2019-09-30)

### Bug Fixes

- **DomainTransfers:** send required contact data for domain transfers 

## 1.2.1 (2019-09-19)

### Bug Fixes

- **release proccess:** fix composer binary path 
- **release process:** migrate configuration 

# 1.2.0 (2019-09-05)

### Features

- **user-transfer:** support for user transfers 

## 1.1.5 (2019-07-19)

### Bug Fixes

- **pkg:** bug fixes in 'Settings' tab, contact data and module log information 

## 1.1.4 (2019-04-26)

### Bug Fixes

- **pkg:** added Blesta version in the user enviroment 

## 1.1.3 (2019-02-01)

### Bug Fixes

- **pkg:** added user environment logging 

## 1.1.2 (2018-12-24)

### Bug Fixes

- **pkg:** Makefile update, removed README.pdf, .odt file and pkg folder 

## 1.1.1 (2018-12-14)

### Bug Fixes

- **pkg:** modified package.json to include zip files in the release 

# 1.1.0 (2018-12-14)

### Features

- **pkg:** Added Makefile 

# 1.0.0 (2018-12-12)

### Bug Fixes

- **pkg:** added .gitignore file 
- **pkg:** added evaluation on registration and renewal periods acc. QueryDomainOptions 
- **pkg:** fixed a bug in admin settings tab 
