cask "soundcraft-cli" do
  version "0.8.0"
  sha256 "41852f04159d64d62054a9d89b35fd9177eecdfdb53b5c8b52887d31dc4cef71"

  # Upstream's own notarised build; this tap only points at it.
  url "https://github.com/storytold/soundcraft/releases/download/v#{version}/soundcraft-cli-#{version}-macos-universal.zip"
  name "SoundCraft CLI"
  desc "Command-line interface and MCP server for SoundCraft"
  homepage "https://github.com/storytold/soundcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  # `app --port` drives the running app: bump this cask with Homebrew's app cask.
  depends_on cask: "soundcraft"

  binary "soundcraft-cli-#{version}-macos-universal/soundcraft-cli"
end
