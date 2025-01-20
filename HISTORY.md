## [4.2.6](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/compare/v4.2.5...v4.2.6) (2025-01-20)


### Bug Fixes

* **cnr registrar module:** patch issue with Get EPP Codes functionality for DE, BE, EU, NO, CN TLDs ([ce6626f](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/commit/ce6626f3704ec9e9cc8506149ebec16bc87081b6))

## [4.2.5](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/compare/v4.2.4...v4.2.5) (2024-11-19)


### Bug Fixes

* **cnr & ispapi module:** patches issue with domain registration/expiration date synchronisation ([e892900](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/commit/e892900ceb140901d9afd72d7c6d1b0071083de4))

## [4.2.4](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/compare/v4.2.3...v4.2.4) (2024-11-08)


### Bug Fixes

* **cnic registrar module:** patched url forwarding bug and improved user experience ([b55ed76](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/commit/b55ed76fc9505594ed54106d6f9aee9e2e8d2dc3))

## [4.2.3](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/compare/v4.2.2...v4.2.3) (2024-11-07)


### Bug Fixes

* **hexonet registrar module:** patches issue with getRegistrationDate for domains ([393b18d](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/commit/393b18dc96f07290f8a2e8a0c49b1975dd86b74d))

## [4.2.2](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/compare/v4.2.1...v4.2.2) (2024-10-18)


### Bug Fixes

* **cnr registrar module:** improved cache handling and tld pricing import fix ([e9b98ad](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/commit/e9b98adbfbfe86bda165e1f9f1e93d495b56aa7c))

## [4.2.1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/compare/v4.2.0...v4.2.1) (2024-10-18)


### Bug Fixes

* **cnr registrar module:** de and it additional fields patch ([28bae34](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/commit/28bae34c5a079d75d6641a6f61e16ff9801802dd))
* **cnr registrar module:** Transfer Domain additional fields patch, and .de and .it additional fields patch ([531e900](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/commit/531e9005516cafa38dc9a26e261e2291ec57dd33))

## [4.2.1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/compare/v4.2.0...v4.2.1) (2024-10-18)


### Bug Fixes

* **cnr registrar module:** de and it additional fields patch ([28bae34](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/commit/28bae34c5a079d75d6641a6f61e16ff9801802dd))

# [4.2.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/compare/v4.1.0...v4.2.0) (2024-10-17)


### Features

* **cnr registrar module:** show account login connectivity status in the manage module section ([820942a](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/commit/820942a405623569454051bda2c115bccbe4aac2))

# [4.1.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/compare/v4.0.1...v4.1.0) (2024-10-15)


### Features

* **CNR Registrar Module:** API-Driven domain additional fields with custom translations, also includes an patch which fixes the issue with TLD Pricing Import ([8961088](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/commit/896108843fc35c074f6f8046a632d6ffad9d9587))

## [4.0.1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/compare/v4.0.0...v4.0.1) (2024-10-15)


### Bug Fixes

* **cnr registrar module:** patched an issue to avoid conflict with ispapi module ([6936fa0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/commit/6936fa0f1c141184959fcc547219fc5e8eacedff))

# [4.0.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/compare/v3.7.0...v4.0.0) (2024-09-25)


### Features

* **CentralNic Reseller:** Introduce Registrar Module ([44ba3c4](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta/commit/44ba3c4f86044218dd7ed87135f6fbf94563db23))


### BREAKING CHANGES

* **CentralNic Reseller:** Deprecate HEXONET registrar module as of upcoming migration to the CentralNic Reseller (CNR) Platform and by that in favor of the CNR Module. We still offer the HEXONET/ispapi registrar module via ZIP File in master branch or via Readme / Release Overview.

# [3.7.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.6.0...v3.7.0) (2024-06-24)


### Features

* **ispapi registrar module:** Add getRegistrationDate for Blesta 5.10.0 compatibility and bug fixes ([393cefb](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/393cefbccc35856da4e421e2f566cbe5b73911a6))

# [3.6.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.5.1...v3.6.0) (2024-03-18)


### Features

* **hexonet registrar module:** Implemented DNSSEC feature integration along with additional module configuration. ([a88aa1d](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/a88aa1dcc80aaade77ca98e8c56b73c6b07329f9))

## [3.5.1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.5.0...v3.5.1) (2024-03-12)


### Performance Improvements

* **hexonet registrar module:** caching tld periods and addons data to improve performance ([2deafde](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/2deafde38cbc64d489c706c6a197d5fa1c9301bc))

# [3.5.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.4.1...v3.5.0) (2024-03-11)


### Features

* **hexonet registrar module:** added custom nameserver hosts feature for domains ([095c20b](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/095c20bfc77ab41b895a40b26b6b608319c1fa4f))

## [3.4.1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.4.0...v3.4.1) (2024-03-07)


### Bug Fixes

* **hexonet registrar module:** Domain ID Protection and Whois Privacy fix ([2c94abd](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/2c94abd153da28cb08ddb5e70364864083768a0d))

# [3.4.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.3.0...v3.4.0) (2024-03-07)


### Features

* **hexonet registrar module:** enhanced Experienced for ID Protection, Domain Lock and Auth Code ([b3cc939](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/b3cc93964f8617db0ed3f3759d61b295b9c6f727))

# [3.3.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.2.1...v3.3.0) (2024-3-6)


### Features

* **hexonet registrar module:** Added Email Forwarding Addon Feature ([3c0c670](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/3c0c670d84a300d25c32a124cfe44f0a3690cff6))

## [3.2.1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.2.0...v3.2.1) (2024-3-5)


### Bug Fixes

* **hexonet registrar module:** fixed client area missing tab for DNS management ([83dd4aa](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/83dd4aa54eaa5c33ff37c99749f55db8653a6acb))

# [3.2.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.1.2...v3.2.0) (2024-3-4)


### Features

* **Hexonet Registrar Module:** Added DNS Management Addon Feature, Fixed Bugs, and Enhanced Performance ([f9a346d](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/f9a346d7030678b9e26d243d6e07d90102b2779c))

## [3.1.2](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.1.1...v3.1.2) (2024-2-26)


### Bug Fixes

* **hexonet blesta registrar module:** Patched an issue updating nameservers via the Manage Domains admin panel. ([c56f37c](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/c56f37c3c47e242e567fd85614d64a8acdcddc88))

## [3.1.1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.1.0...v3.1.1) (2024-2-21)


### Bug Fixes

* **blesta registrar module:** manual renewals fix via manage domain section in admin panel ([fb67d52](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/fb67d524a3a3183d0332c82b7a86d73763f747c9))

# [3.1.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.13...v3.1.0) (2024-2-19)


### Features

* **tld import:** identify tlds fully automated, deprecate config setting ([c496507](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/c496507d7bd730e6a380567b24a75440c99fee31))

## [3.0.13](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.12...v3.0.13) (2024-2-19)


### Bug Fixes

* **blesta registrar module:** patch for missing period from Domain Renewals ([1f7f84d](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/1f7f84d7faa2e09a409915f83b9182c706fc004c))

## [3.0.12](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.11...v3.0.12) (2023-07-21)


### Bug Fixes

* **.nz, .fi:** review requesting auth ([6a50035](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/6a500354892eee675be39a428e1aea34f5ac7823))
* **.nz/.fi:** fix oversight with var name ([b5930fb](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/b5930fb089d5df1cb1dd152933b29b3f6e1587b8))

## [3.0.11](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.10...v3.0.11) (2022-11-30)


### Bug Fixes

* **nameservers:** patched php issues in tab nameservers ([7546e09](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/7546e09c8a52f9fa8bc1b24fbd1ff3507082d60f))

## [3.0.10](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.9...v3.0.10) (2022-11-29)


### Bug Fixes

* **getexpirydate:** patch use of Date->format ([352a772](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/352a772a0802c2c8d670943937dd2fd851133189))

## [3.0.9](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.8...v3.0.9) (2022-11-28)


### Bug Fixes

* **psr12:** cleaned dangling spaces ([aaf73c5](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/aaf73c52fdad9420fc2a995704ee8b69ced7da6d))
* **registration/transfer:** patch index access error for nameservers ([7e4bb0c](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/7e4bb0c56598f7d1e7fa8497f8bf1f50c2dd2aac))

## [3.0.8](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.7...v3.0.8) (2022-11-24)


### Bug Fixes

* **archives:** add missing software dependency SDK ([ca55ce5](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/ca55ce512cbf993bb953780efdf4514a7bd73bd1))
* **php:** use php 7.4 in release process ([b247dcd](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/b247dcd7230565d30ed3f19630490a826824704f))

## [3.0.7](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.6...v3.0.7) (2022-11-24)


### Bug Fixes

* **sdk:** includes missing php-sdk vendor files in this patch ([ff052ea](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/ff052ea4ecc3e735f8656d26beae7610b74e7a67))

## [3.0.6](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.5...v3.0.6) (2022-11-24)


### Bug Fixes

* **sdk:** upgrade sdk to version 8.0.4 (OTE connectivity fix) ([be382ea](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/be382eaf0a039f235fd848f3e47e8b35fae6304f))

## [3.0.5](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.4...v3.0.5) (2022-06-14)

### Bug Fixes

- **ci:** review build tool dependencies and test release process (no need to upgrade!) ([f62a438](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/f62a438bf8c48a11eee50788dc45bb4d51331042))

## [3.0.4](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.3...v3.0.4) (2021-11-30)

### Bug Fixes

- **renewService:** fix PayDomainRenewal ([611456d](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/611456deb7161fe558c723c1f6b772ffa2026046))

## [3.0.3](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.2...v3.0.3) (2021-11-09)

### Bug Fixes

- **checkavailability:** minor review (no nxd, domain blocks) ([f9e4198](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/f9e41980fe9e05387f2923f03129d5d9da49a20e))

## [3.0.2](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.1...v3.0.2) (2021-10-20)

### Bug Fixes

- **getAdminAddFields:** fix endless-loop ([da39265](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/da39265e7ee15ef648de308189a7f50cc7ba3437))

## [3.0.1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v3.0.0...v3.0.1) (2021-08-12)

### Bug Fixes

- **build:** fixed archive file list globbing to fully including our SDKs source files ([b6600ee](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/b6600ee39854b70329acf03b142b0201d912e986))

# [3.0.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v2.0.3...v3.0.0) (2021-08-10)

### Features

- **php-sdk:** migration to our API Connector ([c96918a](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/c96918ae9d4bb1275ea7a2b828cea3b97d6efbfe))

### BREAKING CHANGES

- **php-sdk:** API Class Instantiation, Communication and Logging has been revamped from scratch.

## [2.0.3](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v2.0.2...v2.0.3) (2021-08-06)

### Bug Fixes

- **gettlds:** order the list of TLDs more nicely ([0553d12](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/0553d12779e66f239084ae790731e9d76d79ac34))

## [2.0.2](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v2.0.1...v2.0.2) (2021-08-05)

### Bug Fixes

- **ci:** include updated config.json in version commit ([8bef494](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/8bef494765fb448ace47fb38c18b46be40fd48e0))

## [2.0.1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v2.0.0...v2.0.1) (2021-08-05)

### Bug Fixes

- **gettlds:** fixed building list of supported TLDs ([b1b286d](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/b1b286df9b64049e778a23316c5c52bb6b7bc16c))

# [2.0.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.3.3...v2.0.0) (2021-08-05)

### Features

- **blesta 5.2:** initial revamp ([e2147b6](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/e2147b61a7de9eff73a4121c394f95a6cd7b37a6))

### BREAKING CHANGES

- **blesta 5.2:** Reviewed to be compatible with Blesta 5.2.

## [1.3.3](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.3.2...v1.3.3) (2021-02-01)

### Bug Fixes

- **.my / .ae / .qa:** added requested TLDs (.my, .ae, .qa) - more to come ([27b8c03](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/27b8c034e7a7924cbb5a0411f53cf0524b01329d)), closes [#86](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/issues/86)

## [1.3.2](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.3.1...v1.3.2) (2021-01-27)

### Bug Fixes

- **ci:** migrated to gh actions and gulp; reviewed folder structure; ([93cc220](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/93cc220c039d46a36957b54ac2e7c810fb6ae729))
- **github actions:** fixed archives; excluded vendor folder ([d2b4125](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/d2b41259d62a27398227ee5c7e747a79b6cd2c4f))

## [1.3.1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.3.0...v1.3.1) (2020-03-23)

### Bug Fixes

- **expiry-date:** expiry date auto-detection ([40599bc](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/40599bc6cc01d31b5c3d0129e0f220359065704f))

# [1.3.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.2.2...v1.3.0) (2020-02-26)

### Features

- **transfer:** auto-detection for 0Y period, Transfer domain checks ([434d1e3](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/434d1e380685c7fb3f42ae0a43e645ac0edff0f4))

## [1.2.2](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.2.1...v1.2.2) (2019-09-30)

### Bug Fixes

- **DomainTransfers:** send required contact data for domain transfers ([9e52790](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/9e52790))

## [1.2.1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.2.0...v1.2.1) (2019-09-19)

### Bug Fixes

- **release proccess:** fix composer binary path ([774aca0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/774aca0))
- **release process:** migrate configuration ([9489f31](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/9489f31))

# [1.2.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.1.5...v1.2.0) (2019-09-05)

### Features

- **user-transfer:** support for user transfers ([1ef7171](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/1ef7171))

## [1.1.5](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.1.4...v1.1.5) (2019-07-19)

### Bug Fixes

- **pkg:** bug fixes in 'Settings' tab, contact data and module log information ([04585f2](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/04585f2))

## [1.1.4](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.1.3...v1.1.4) (2019-04-26)

### Bug Fixes

- **pkg:** added Blesta version in the user enviroment ([93141cc](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/93141cc))

## [1.1.3](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.1.2...v1.1.3) (2019-02-01)

### Bug Fixes

- **pkg:** added user environment logging ([861a7ae](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/861a7ae))

## [1.1.2](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.1.1...v1.1.2) (2018-12-24)

### Bug Fixes

- **pkg:** Makefile update, removed README.pdf, .odt file and pkg folder ([8c8d293](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/8c8d293))

## [1.1.1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.1.0...v1.1.1) (2018-12-14)

### Bug Fixes

- **pkg:** modified package.json to include zip files in the release ([ca55c51](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/ca55c51))

# [1.1.0](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/compare/v1.0.0...v1.1.0) (2018-12-14)

### Features

- **pkg:** Added Makefile ([2ece17c](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/2ece17c))

# 1.0.0 (2018-12-12)

### Bug Fixes

- **pkg:** added .gitignore file ([09d86a1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/09d86a1))
- **pkg:** added evaluation on registration and renewal periods acc. QueryDomainOptions ([c7722e5](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/c7722e5))
- **pkg:** fixed a bug in admin settings tab ([cb336b1](https://github.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/commit/cb336b1))
