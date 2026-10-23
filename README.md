# homebrew-apps

Egildo's tap for apps and tools that have no Homebrew cask or formula.

```bash
brew install egildo/apps/punchr
```

Public, so `brew tap egildo/apps` works over plain HTTPS and no token is involved. The private tap, `egildo/tap`, is separate and holds the formulae, except the one below, which is public because its source is.

## Formula

- **[punchr](https://codeberg.org/egildo/punchr)** — dresses folders in Finder (tags, stamps, custom icons) by the state another program names. Egildo's own, MIT. A formula, not a cask: it builds from the tagged source on Codeberg with the Command Line Tools' `swiftc`, so the app is never quarantined and ad-hoc signing is enough. macOS 26 (Tahoe) only.

## Moved or removed

- **The storytold Craft CLIs** moved to their own tap, [egildo/artcraft](https://github.com/egildo/homebrew-artcraft). `tap_migrations.json` sends the ones installed from here there.
- **image-studio** (a build of [martinkovacs/image-studio](https://github.com/martinkovacs/image-studio), which ships no macOS build) was removed on 2026-10-23. Its cask, and the recipe it was built with, are in this repository's history.
