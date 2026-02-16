cask "speakclaw" do
  version "1.0.1"

  on_arm do
    url "https://speakclaw-releases.s3.eu-west-1.amazonaws.com/desktop/v#{version}/SpeakClaw_#{version}_aarch64.dmg"
    sha256 "02b50f33a12b4c767193ba40a7c4c74d42266ac8178863a9d28232fd311501e5"
  end

  on_intel do
    url "https://speakclaw-releases.s3.eu-west-1.amazonaws.com/desktop/v#{version}/SpeakClaw_#{version}_x64.dmg"
    sha256 "9995218ac914c1f593c2fc31481c37ac7e08a9410978d82d7d393ad0fd481884"
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
