cask "cadcraft-cli" do
  version "0.8.0"
  sha256 "0647286d06e2bf5da9fd1303f481966962ad224b57b4fa7adf2087a1e387e30b"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/cadcraft/releases/download/v#{version}/cadcraft-cli-#{version}-macos-universal.zip"
  name "CADCraft CLI"
  desc "Command-line interface and MCP server for CADCraft"
  homepage "https://github.com/storytold/cadcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  # `mcp --connect` drives the running app: bump this cask with Homebrew's app cask.
  depends_on cask: "cadcraft"

  binary "cadcraft-cli-#{version}-macos-universal/cadcraft-cli"
end
