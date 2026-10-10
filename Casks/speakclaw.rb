cask "speakclaw" do
  version "1.1.1"

  on_arm do
    sha256 "b6775ef721b4ed4083830f26d6c459e35d7c408faf9a3cf6c226542cc6fac2a5"

    url "https://speakclaw-desktop-downloads.s3.us-east-1.amazonaws.com/desktop/v#{version}/SpeakClaw_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "a053776088486b769b8b8c569986bf39ecbf5e147d6bc8edc596ab08f427dbd2"

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
