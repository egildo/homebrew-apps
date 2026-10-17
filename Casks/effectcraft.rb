cask "effectcraft" do
  version "0.10.0"
  sha256 "d84bfac63e566815b413309cf92d3db48cc1a3d2f20b949742d45735bdb597e8"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/effectcraft/releases/download/v#{version}/effectcraft-#{version}-macos-universal.dmg"
  name "EffectCraft"
  desc "Motion graphics and compositing tool"
  homepage "https://github.com/storytold/effectcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "EffectCraft.app"

  zap trash: [
    "~/Library/Application Support/EffectCraft/state.json",
    "~/Library/Preferences/ai.storyteller.effectcraft.plist",
  ]
end
