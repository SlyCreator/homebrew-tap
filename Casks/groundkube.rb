cask "groundkube" do
  version "0.1.0"

  url "https://downloads.grindkube.com/releases/v0.1.0/GroundKube_0.1.0_aarch64.dmg"
  sha256 "cac6041910966ea7daf0331dbd1486fd470a94081df2343f027b0acfa762ff06"

  depends_on arch: :arm64

  name "GroundKube"
  desc "Local Kubernetes practice labs — no cloud, no session limits"
  homepage "https://grindkube.com"

  depends_on macos: ">= :ventura"

  app "GroundKube.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/GroundKube.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/dev.groundkube.app",
    "~/Library/Caches/dev.groundkube.app",
    "~/Library/Preferences/dev.groundkube.app.plist",
  ]
end
