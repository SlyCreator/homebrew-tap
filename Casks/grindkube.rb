cask "grindkube" do
  version "0.3.1"

  url "https://downloads.grindkube.com/releases/v0.3.1/GrindKube_0.3.1_aarch64.dmg"
  sha256 "3a880d4a9c093ece7b24ebfaa47a769f152108aa04318acc1251ba9b0c5bdf6c"

  depends_on arch: :arm64

  name "GrindKube"
  desc "Local Kubernetes practice labs — no cloud, no session limits"
  homepage "https://grindkube.com"

  depends_on macos: ">= :ventura"

  app "GrindKube.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/GrindKube.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/dev.grindkube.app",
    "~/Library/Caches/dev.grindkube.app",
    "~/Library/Preferences/dev.grindkube.app.plist",
  ]
end
