cask "grindkube" do
  version "0.3.12"

  url "https://downloads.grindkube.com/releases/v0.3.12/GrindKube_0.3.12_aarch64.dmg"
  sha256 "f1b00d6401cb9fb083ea1178614c72f5e578429a73d39512181000ad604ccf88"

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
