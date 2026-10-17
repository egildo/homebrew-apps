cask "effectcraft-cli" do
  version "0.10.0"
  sha256 "5da3adb581f0cd49edaa9ae2eeeaa50426cb1afbb0794902551db3d7173dd12a"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/effectcraft/releases/download/v#{version}/effectcraft-cli-#{version}-macos-universal.zip"
  name "EffectCraft CLI"
  desc "Command-line interface and MCP server for EffectCraft"
  homepage "https://github.com/storytold/effectcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  # `mcp --bridge` drives the running app, so the two are kept at one version.
  depends_on cask: "egildo/apps/effectcraft"

  binary "effectcraft-cli-#{version}-macos-universal/effectcraft-cli"
end
