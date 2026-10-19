cask "gridcraft-cli" do
  version "0.8.0"
  sha256 "564f7d087b880b7f16aa60ae50a1cbe9d37b4ed449eb29b2646ea584479bab07"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/gridcraft/releases/download/v#{version}/gridcraft-cli-#{version}-macos-universal.zip"
  name "GridCraft CLI"
  desc "Command-line interface and MCP server for GridCraft"
  homepage "https://github.com/storytold/gridcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  # `mcp --connect` drives the running app: bump this cask with Homebrew's app cask.
  depends_on cask: "gridcraft"

  binary "gridcraft-cli-#{version}-macos-universal/gridcraft-cli"
end
