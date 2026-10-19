cask "photocraft-cli" do
  version "0.10.0"
  sha256 "57b2bfa6514beb9f85177fbb6832f8aa3aebee08561d78d54a3182c404220927"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/photocraft/releases/download/v#{version}/photocraft-cli-#{version}-macos-universal.zip"
  name "PhotoCraft CLI"
  desc "Command-line interface and MCP server for PhotoCraft"
  homepage "https://github.com/storytold/photocraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  # `mcp` can bridge to the running app: bump this cask with Homebrew's app cask.
  depends_on cask: "photocraft"

  binary "photocraft-cli-#{version}-macos-universal/photocraft-cli"
end
