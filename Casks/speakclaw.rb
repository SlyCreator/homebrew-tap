cask "speakclaw" do
  version "1.0.0"

  on_arm do
    url "https://speakclaw-releases.s3.eu-west-1.amazonaws.com/desktop/v#{version}/SpeakClaw_#{version}_aarch64.dmg"
    sha256 "d3a6fb365e5a758c6f618b8622b0f7d6213f28a05d264420e8980885e410ef9d"
  end

  on_intel do
    url "https://speakclaw-releases.s3.eu-west-1.amazonaws.com/desktop/v#{version}/SpeakClaw_#{version}_x64.dmg"
    sha256 "61b4601b1db9036bcb736661b9ec4e499f70b6c4e605ceb20c9b0fc5d7e512a0"
  end

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
