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
