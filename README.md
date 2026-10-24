# homebrew-apps

Egildo's tap for apps and tools that have no Homebrew cask or formula.

```bash
brew install egildo/apps/punchr
brew install --cask egildo/apps/barium
```

Public, so `brew tap egildo/apps` works over plain HTTPS and no token is involved. The private tap, `egildo/tap`, is separate and holds the formulae, except the one below, which is public because its source is.

## Formula

- **[punchr](https://codeberg.org/egildo/punchr)** — dresses folders in Finder (tags, stamps, custom icons) by the state another program names. Egildo's own, MIT. A formula, not a cask: it builds from the tagged source on Codeberg with the Command Line Tools' `swiftc`, so the app is never quarantined and ad-hoc signing is enough. macOS 26 (Tahoe) only.

## Cask

- **[barium](https://codeberg.org/egildo/barium)** — Barium, Egildo's browser: a fork of [Flow Browser](https://github.com/MultiboxLabs/flow-browser) (Electron, GPL-3.0) with Arc's manners. Built from the tagged source on Codeberg with `bun run build:mac` and ad-hoc signed, so the cask strips the quarantine flag after install. Not notarised, no Widevine yet. Apple Silicon, macOS 12 or later. The dmg is a release asset of this repository, tag `barium-v<version>`.

| version | source commit | sha256 |
|---|---|---|
| 0.1.0 | see the release notes | see the cask |

## Moved or removed

- **The storytold Craft CLIs** moved to their own tap, [egildo/artcraft](https://github.com/egildo/homebrew-artcraft). `tap_migrations.json` sends the ones installed from here there.
- **image-studio** (a build of [martinkovacs/image-studio](https://github.com/martinkovacs/image-studio), which ships no macOS build) was removed on 2026-10-23. Its cask, and the recipe it was built with, are in this repository's history.
