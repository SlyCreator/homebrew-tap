cask "netvow" do
  version "0.1.0"

  on_arm do
    url "https://github.com/SlyCreator/NetVow/releases/download/v#{version}/NetVow_#{version}_aarch64.dmg"
    sha256 "965ca44411566efab2bb38aa307a872e4463fe537baea6926a9da06288183529"
  end

  on_intel do
    url "https://github.com/SlyCreator/NetVow/releases/download/v#{version}/NetVow_#{version}_aarch64.dmg"
    sha256 "965ca44411566efab2bb38aa307a872e4463fe537baea6926a9da06288183529"
  end

  name "NetVow"
  desc "OS-level website blocker for focus and accountability"
  homepage "https://github.com/SlyCreator/NetVow"

  depends_on macos: ">= :catalina"

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
  ]
end
