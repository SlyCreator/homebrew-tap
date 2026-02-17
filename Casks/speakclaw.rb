cask "speakclaw" do
  version "1.0.2"

  url "https://speakclaw-releases.s3.eu-west-1.amazonaws.com/desktop/v#{version}/SpeakClaw_#{version}_aarch64.dmg"
  sha256 "eab983eddeb74eba91785bb9c80f97eaf03b96bf30947a488a55132333589c05"

  depends_on arch: :arm64

  name "SpeakClaw"
  desc "System-wide voice-to-text for macOS"
  homepage "https://speakclaw.com"

  depends_on macos: ">= :ventura"

  app "SpeakClaw.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/SpeakClaw.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.speakclaw.desktop",
    "~/Library/Caches/com.speakclaw.desktop",
    "~/Library/Preferences/com.speakclaw.desktop.plist",
  ]
end
