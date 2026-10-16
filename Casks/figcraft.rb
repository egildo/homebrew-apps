cask "figcraft" do
  version "0.6.0"
  sha256 "26385f23a95190458081c20efac0c1d86546b899ccbdabc7364f396dcacc7cc4"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/figcraft/releases/download/v#{version}/figcraft-#{version}-macos-universal.dmg"
  name "FigCraft"
  desc "Interface design and prototyping tool"
  homepage "https://github.com/storytold/figcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "FigCraft.app"

  # Recovery holds unsaved documents, so it is left alone.
  zap trash: [
    "~/Library/Application Support/FigCraft/state.json",
    "~/Library/Preferences/ai.storyteller.figcraft.plist",
  ]
end
