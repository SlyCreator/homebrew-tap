cask "grindkube" do
  version "0.3.6"

  url "https://downloads.grindkube.com/releases/v0.3.6/GrindKube_0.3.6_aarch64.dmg"
  sha256 "2a1d44f0c825f52d8145aaa2245f659218957709579bba65914a81272b705183"

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
