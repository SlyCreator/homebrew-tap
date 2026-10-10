cask "speakclaw" do
  version "1.1.2"

  on_arm do
    sha256 "594f35873acab4701ec999668103d697c68773fd057306684ee9259c04fc22fd"

    url "https://speakclaw-desktop-downloads.s3.us-east-1.amazonaws.com/desktop/v#{version}/SpeakClaw_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "bdcc9b0132ddd2b63a9a22bb59f57ad4b60cfc7721041f4e60c72a2db0c9a164"

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
