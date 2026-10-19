# homebrew-apps

Egildo's tap for apps and tools that have no Homebrew cask: some publish a macOS build and only lack the cask, others have no macOS build at all and are built here.

```bash
brew install --cask egildo/apps/image-studio
brew install --cask egildo/apps/figcraft-cli   # brings Homebrew's figcraft with it
brew install --cask egildo/apps/vectorcraft-cli
brew install --cask egildo/apps/effectcraft-cli
brew install --cask egildo/apps/photocraft-cli
brew install --cask egildo/apps/cadcraft-cli
brew install --cask egildo/apps/soundcraft-cli
brew install --cask egildo/apps/designcraft-cli
```

Public, so `brew tap egildo/apps` works over plain HTTPS and no token is involved. The private tap, `egildo/tap`, is separate and holds the formulae.

## Casks

- **[image-studio](https://github.com/martinkovacs/image-studio)** — image generation and editing studio for OpenRouter and local stable-diffusion.cpp (Electron). Apple Silicon only, macOS 13+.
- **The storytold Craft CLIs**: [figcraft-cli](https://github.com/storytold/figcraft), [vectorcraft-cli](https://github.com/storytold/vectorcraft), [effectcraft-cli](https://github.com/storytold/effectcraft), [photocraft-cli](https://github.com/storytold/photocraft), [cadcraft-cli](https://github.com/storytold/cadcraft), [soundcraft-cli](https://github.com/storytold/soundcraft), [designcraft-cli](https://github.com/storytold/designcraft). Each is the app's command line and MCP server, and depends on the app's own cask in Homebrew (`homebrew/cask`), which this tap no longer carries. `tap_migrations.json` moves an app installed from this tap to Homebrew's cask. Homebrew's core has a formula named `photocraft-cli` (the headless engine alone), so install this one as `egildo/apps/photocraft-cli`.

## Where the binaries come from

**The `*craft-cli` casks**: upstream's own release assets (`<app>-cli-<version>-macos-universal.zip`), notarised by their developer (storytold), Apache-2.0 (the archives also carry an MIT licence). The casks point straight at them; nothing is rebuilt or rehosted. The `sha256` values are the ones in upstream's `SHA256SUMS.txt`.

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

For a `*craft-cli`, bump `version` when Homebrew's app cask moves, and copy the `sha256` from upstream's `SHA256SUMS.txt`. For image-studio, bump `version` and `sha256`, rebuild, attach the dmg to a release tagged `<cask>-v<version>`, then `brew style` and `brew audit --cask` before committing.
