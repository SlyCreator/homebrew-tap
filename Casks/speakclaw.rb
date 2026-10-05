cask "speakclaw" do
  version "1.1.0"

  on_arm do
    sha256 "417d3c14f393faa606a731a558b90b48e0011b7e863812ad39b396e1566c38f0"

    url "https://speakclaw-desktop-downloads.s3.us-east-1.amazonaws.com/desktop/v#{version}/SpeakClaw_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "3245e0fe2d5e3bfb0b04a95c25cee8c9314731ff563d9eca6db5b73897b117cb"

    url "https://speakclaw-desktop-downloads.s3.us-east-1.amazonaws.com/desktop/v#{version}/SpeakClaw_#{version}_x64.dmg"
  end

  name "SpeakClaw"
  desc "System-wide voice-to-text"
  homepage "https://speakclaw.com/"

  # The app updates itself (Tauri updater via api.speakclaw.com).
  auto_updates true
  depends_on macos: :ventura

  app "SpeakClaw.app"

  # Clears the quarantine flag. Needed while builds are signed but not
  # notarized (Apple developer account migration, October 2026).
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
