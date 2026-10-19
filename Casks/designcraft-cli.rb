cask "designcraft-cli" do
  version "0.9.0"
  sha256 "1c11a863755b9eb38209c8521bd46c42888260179f016a125b3ba5d293c0cb84"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/designcraft/releases/download/v#{version}/designcraft-cli-#{version}-macos-universal.zip"
  name "DesignCraft CLI"
  desc "Command-line interface and MCP server for DesignCraft"
  homepage "https://github.com/storytold/designcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Shares one command registry and control channel with the app: bump this cask with Homebrew's app cask.
  depends_on cask: "designcraft"

  binary "designcraft-cli-#{version}-macos-universal/designcraft-cli"
end
