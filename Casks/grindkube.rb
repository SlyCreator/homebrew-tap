cask "grindkube" do
  version "0.3.9"

  url "https://downloads.grindkube.com/releases/v0.3.9/GrindKube_0.3.9_aarch64.dmg"
  sha256 "a9dc50ee0824d889e03de8304cdc31b0e7f430f732c73991a4383f3649aebc27"

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
