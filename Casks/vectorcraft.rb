cask "vectorcraft" do
  version "0.12.0"
  sha256 "e47987d0e90fa1c629cf1328d83b91f82680b4c02d06794bdf5e3eb0b2c4dc7b"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/vectorcraft/releases/download/v#{version}/vectorcraft-#{version}-macos-universal.dmg"
  name "VectorCraft"
  desc "Vector art tool"
  homepage "https://github.com/storytold/vectorcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "VectorCraft.app"

  zap trash: [
    "~/Library/Application Support/VectorCraft/state.json",
    "~/Library/Preferences/ai.storyteller.vectorcraft.plist",
  ]
end
