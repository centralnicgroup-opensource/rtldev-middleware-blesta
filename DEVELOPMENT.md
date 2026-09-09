# Development

The repository root is the module root. Copy it to `components/modules/cnr` in a
Blesta installation, or symlink it there, and Blesta picks it up.

```
cnr.php  config.json          entry point and manifest
apis/                         the API client and its vendored dependencies
config/                       field definitions read through Configure
language/                     translatable strings
lib/                          the module's own classes
views/                        admin and client templates
tests/                        the unit suite
```

## Running the tests

Nothing beyond PHP 8.3 and Composer is needed. The suite does not talk to the
registry — it covers the pure logic, using captured API responses as fixtures.

```bash
composer install
apis/vendor/bin/phpunit        # 99 tests
apis/vendor/bin/phpcs -q -n -s # PSR-12, minus the namespace rules a Blesta module cannot satisfy
```

Both run on every pull request.

## Working against a real Blesta

The module needs a Blesta installation to exercise anything that talks to the
registry, and a CentralNic Reseller account to talk to. Use the OT&E environment
rather than production: tick **Sandbox** on the module row so registrations,
renewals and transfers cost nothing and can be thrown away.

## What the tests cover, and why those cases

The fixtures in `tests/fixtures/zoneinfo.json` are real responses for `.no`,
`.com`, `.com.ai`, `.ac.cr`, `.aaa.pro` and `.com.vu`. They are kept because
these are the zones that decide which terms can be sold: `.no` registers for one
year only, `.com.ai` starts at two, `.ac.cr` registers for up to ten years but
renews one at a time, and `.com.vu` reports no renewal period at all. A change
that gets any of them wrong sells a term the registry will refuse.

## Releases

Releases are cut from a separate, private repository that holds the dev
container and the release tooling. It tags this repository, writes the
changelog, and attaches the archive to a GitHub release. Nothing here needs to
be run by hand to publish a version.
