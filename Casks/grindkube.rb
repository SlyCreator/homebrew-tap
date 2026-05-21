cask "grindkube" do
  version "0.3.13"

  url "https://downloads.grindkube.com/releases/v0.3.13/GrindKube_0.3.13_aarch64.dmg"
  sha256 "1fbf1baf74198b4ea80aeb7bd822903337810ba7ecd79254369c5ad482e0c1f4"

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
