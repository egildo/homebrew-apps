cask "figcraft-cli" do
  version "0.6.0"
  sha256 "119446cc8f50b719dad7a73e0356de6194aa262b6520b362dfe310ee9f05b3be"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/figcraft/releases/download/v#{version}/figcraft-cli-#{version}-macos-universal.zip"
  name "FigCraft CLI"
  desc "Command-line interface and MCP server for FigCraft"
  homepage "https://github.com/storytold/figcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  # `mcp --attach` drives the running app, so the two are kept at one version.
  depends_on cask: "egildo/apps/figcraft"

  binary "figcraft-cli-#{version}-macos-universal/figcraft-cli"
end
