# Project Instructions

## Project Overview

Public distribution repository for the CentralNic Reseller (`cnr`) registrar module for
Blesta 6: a flattened copy of the module at the repository root, plus the release archive
`blesta-cnr-registrar-latest.zip`. It is published here by the release of the internal
`centralnicgroup/rtldev-middleware-blesta-src` repository, where development, tests and
linters live.

- **Language / runtime:** PHP (`"php": ">=8.3"` in `composer.json`), Blesta 6
- **Package name:** `centralnicgroup-opensource/blesta-cnr` (`composer.json`)
- **Default branch:** `main`

## Architecture

- **The publish owns the module.** `cnr.php`, `config.json`, `composer.json`, `apis/`,
  `config/`, `language/`, `lib/`, `views/`, `README.md`, `CHANGELOG.md` and `LICENSE` are
  copied from `components/modules/cnr/` in blesta-src on every release, and the zip is built
  at the blesta-src root (`release-config.json`). Change them there, never here.
- **The publish only copies, it never deletes.** A file renamed or removed in blesta-src
  stays here until it is deleted by hand.
- **Owned here:** `.github/ISSUE_TEMPLATE/`, `CONTRIBUTING.md` and `.gitignore` are not
  published and are edited in this repository.
- **The module version is `config.json`'s `version`**, written by the release.

## Build, CI & Policies

- **No CI, tests or linters in this repository.** They run in blesta-src, whose release
  checks this repository out as `public-repo` and pushes over the
  `RTLDEV_MW_CI_DIST_SSH_KEY` deploy key.
- **The `composer.json` scripts do not run here** — there is no test suite or phpcs config
  in this repository; run `composer test`/`codecheck` in blesta-src.
- **Releases here are cut only by `cnr`-scoped commits.** The nested release
  (`.releaserc.dist.json` in blesta-src) counts `feat(cnr)`, `fix(cnr)` and breaking
  `cnr` commits and nothing else.

## Git Conventions

- **Commit messages:** Conventional Commits with **mandatory scope** —
  `<type>(<scope>): <summary>`. Never append a `Co-Authored-By:` trailer.
- **Never use the scope `cnr` by hand** — a `feat`/`fix` scoped `cnr` is counted as a
  release by the next publish.
- **Branch creation:** before creating a branch, and again after any PR merges,
  run `git checkout main && git pull --ff-only` first — it brings in the merged
  commits and their release tags. Never branch from a stale local `main`, from
  `origin/main` (it becomes the new branch's upstream) or from another feature
  branch.
- **Branch naming:** prefix with the Jira issue ID — `RSRMID-1234-short-description`.
- **Pull requests:** include the Jira issue link in the description; after opening, add the
  PR URL as a comment on the Jira issue.
- **Merging:** rebase-merge (`gh pr merge --rebase`). Squash merges are disabled at the
  repository level.

## Atlassian / JIRA

Work is tracked in **Jira Cloud**, project `RSRMID` — not GitHub Issues. Load the
`jira-conventions` skill before creating, editing or transitioning an issue: it carries the
required fields, this repository's title prefix and component, and the worklog rule for Done and Cancelled.

## Do NOT

- Add dependencies without explicit request
- Add `Co-Authored-By:` trailers to commit messages
- Hand-edit a file the blesta-src release publishes — the next release overwrites it
- Re-add a devcontainer, tests, linters or workflows here — they belong in blesta-src
