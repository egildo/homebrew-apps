cask "barium" do
  arch arm: "arm64"

  version "0.1.1"
  sha256 "284073c8e4c9641d1f8cbcba217487bf736ca37efef1d9acfbad6e5e6768c93c"

  url "https://github.com/egildo/homebrew-apps/releases/download/barium-v#{version}/barium-#{version}-#{arch}.dmg"
  name "Barium"
  desc "Browser with Arc's manners: Spaces on their own profiles, routed links"
  homepage "https://codeberg.org/egildo/barium"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Barium.app"

  # Ad-hoc signed and not notarised: strip the quarantine flag so Gatekeeper lets it open
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Barium.app"]
  end

  # Profiles and tabs live in ~/Library/Application Support/Barium and are user data: never zapped
  zap trash: [
    "~/Library/Logs/Barium",
    "~/Library/Preferences/it.tagliareni.barium.plist",
  ]
end
