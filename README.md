# homebrew-apps

Egildo's tap for apps and tools that have no Homebrew cask: some publish a macOS build and only lack the cask, others have no macOS build at all and are built here.

```bash
brew install --cask egildo/apps/image-studio
brew install egildo/apps/punchr
```

Public, so `brew tap egildo/apps` works over plain HTTPS and no token is involved. The private tap, `egildo/tap`, is separate and holds the formulae, except the one below, which is public because its source is.

## Casks

- **[image-studio](https://github.com/martinkovacs/image-studio)** — image generation and editing studio for OpenRouter and local stable-diffusion.cpp (Electron). Apple Silicon only, macOS 13+.
- **The storytold Craft CLIs** moved to their own tap, [egildo/artcraft](https://github.com/egildo/homebrew-artcraft). `tap_migrations.json` sends the ones installed from here there.

## Formula

- **[punchr](https://codeberg.org/egildo/punchr)** — dresses folders in Finder (tags, stamps, custom icons) by the state another program names. Egildo's own, MIT. A formula, not a cask: it builds from the tagged source on Codeberg with the Command Line Tools' `swiftc`, so the app is never quarantined and ad-hoc signing is enough. macOS 26 (Tahoe) only.

## Where the binaries come from

**image-studio**: upstream does not publish a macOS build (its CI builds Linux and Windows only), so its cask points at a release of *this* repository, tagged `<cask>-v<version>`. The build is the project's own, unmodified:

| | image-studio 0.1.0 |
|---|---|
| Upstream commit | `39c9e0ac9d4992820d3ddeddb8a7133635791800` |
| Edition | Full (bundles the macOS stable-diffusion.cpp engine) |
| Built with | Node 25, npm 11, electron-builder 26.15.3, on Apple Silicon |

```bash
git clone https://github.com/martinkovacs/image-studio && cd image-studio
git checkout 39c9e0ac9d4992820d3ddeddb8a7133635791800
npm ci
node scripts/fetch-sdcpp.mjs mac-arm64
node scripts/dist.mjs full --mac dmg --arm64 -c.mac.identity=-
```

`-c.mac.identity=-` is the one addition: it signs the bundle ad hoc, because the stock unsigned output fails `codesign --verify` ("code has no resources but signature indicates they must be present"). The app is **not notarised**; the cask removes the quarantine attribute after install so Gatekeeper lets it open. Check the download against the `sha256` in the cask.

The upstream repository carries no licence. These builds are a convenience for the tap's owner; if the author asks for them to come down, they will.

## Releasing

For image-studio, bump `version` and `sha256`, rebuild, attach the dmg to a release tagged `<cask>-v<version>`, then `brew style` and `brew audit --cask` before committing.
