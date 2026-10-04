cask "image-studio" do
  arch arm: "arm64"

  version "0.1.0"
  sha256 "b3731ef8166bc7e7604a74fe21642c8d2d4ac9bfadd1f321e4efe3599fba98f8"

  # Upstream publishes no macOS build, so this one is built from source and
  # attached to a release of this tap. See the README for how.
  url "https://github.com/egildo/homebrew-apps/releases/download/image-studio-v#{version}/Image-Studio-#{version}-mac-#{arch}.dmg"
  name "Image Studio"
  desc "Image generation and editing studio for OpenRouter and stable-diffusion.cpp"
  homepage "https://github.com/martinkovacs/image-studio"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Image Studio.app"

  # Ad-hoc signed, not notarised, so Gatekeeper would refuse the quarantined app.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Image Studio.app"]
  end

  zap trash: [
    "~/Library/Application Support/Image Studio",
    "~/Library/Caches/com.imagestudio.app",
    "~/Library/Preferences/com.imagestudio.app.plist",
    "~/Library/Saved Application State/com.imagestudio.app.savedState",
  ]
end
