cask "figcraft-cli" do
  version "0.10.0"
  sha256 "e8bb277fef0bfbaa223e82fea25a6e455661ca5e288a69ac622cf6d64c2eabb9"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/figcraft/releases/download/v#{version}/figcraft-cli-#{version}-macos-universal.zip"
  name "FigCraft CLI"
  desc "Command-line interface and MCP server for FigCraft"
  homepage "https://github.com/storytold/figcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  # `mcp --attach` drives the running app: bump this cask with Homebrew's app cask.
  depends_on cask: "figcraft"

  binary "figcraft-cli-#{version}-macos-universal/figcraft-cli"
end
