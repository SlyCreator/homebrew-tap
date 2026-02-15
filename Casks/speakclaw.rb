cask "speakclaw" do
  version "1.0.0"

  on_arm do
    url "https://speakclaw-releases.s3.eu-west-1.amazonaws.com/desktop/v#{version}/SpeakClaw_#{version}_aarch64.dmg"
    sha256 "5ef1fab2c41aec3aca9f892dbe700dfdaa332c1cf8ddec770fc2277da84f505e"
  end

  on_intel do
    url "https://speakclaw-releases.s3.eu-west-1.amazonaws.com/desktop/v#{version}/SpeakClaw_#{version}_x64.dmg"
    sha256 "d60b773fdda908a176b7b85090d2f10cbd3b90285aeabfee09fef4c744194898"
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
