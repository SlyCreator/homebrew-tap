cask "netvow" do
  version "0.1.0"

  url "https://github.com/SlyCreator/homebrew-tap/releases/download/netvow-v#{version}/NetVow_#{version}_aarch64.dmg"
  sha256 "965ca44411566efab2bb38aa307a872e4463fe537baea6926a9da06288183529"

  depends_on arch: :arm64

  name "NetVow"
  desc "OS-level website blocker for focus and accountability"
  homepage "https://github.com/SlyCreator/NetVow"

  depends_on macos: ">= :ventura"

  app "NetVow.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/NetVow.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.netvow.desktop",
    "~/Library/Caches/com.netvow.desktop",
    "~/Library/Preferences/com.netvow.desktop.plist",
    "/etc/sudoers.d/netvow",
  ]
end
