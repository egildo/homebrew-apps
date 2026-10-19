cask "wordcraft-cli" do
  version "0.8.0"
  sha256 "931f2277a357e7d77266ddceea565450b102ca7bf9e0634821162f7bab616dbe"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/wordcraft/releases/download/v#{version}/wordcraft-cli-#{version}-macos-universal.zip"
  name "WordCraft CLI"
  desc "Command-line interface and MCP server for WordCraft"
  homepage "https://github.com/storytold/wordcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  # `mcp --connect` drives the running app: bump this cask with Homebrew's app cask.
  depends_on cask: "wordcraft"

  binary "wordcraft-cli-#{version}-macos-universal/wordcraft-cli"
end
