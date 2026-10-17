cask "vectorcraft-cli" do
  version "0.12.0"
  sha256 "29d97dd6cbef0457824bc54202620d9589adb65bfe5e13459866531747dec5df"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/vectorcraft/releases/download/v#{version}/vectorcraft-cli-#{version}-macos-universal.zip"
  name "VectorCraft CLI"
  desc "Command-line interface and MCP server for VectorCraft"
  homepage "https://github.com/storytold/vectorcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  # `mcp` connects to the running app (127.0.0.1:7979 by default), so the two are kept at one version.
  depends_on cask: "egildo/apps/vectorcraft"

  binary "vectorcraft-cli-#{version}-macos-universal/vectorcraft-cli"
end
