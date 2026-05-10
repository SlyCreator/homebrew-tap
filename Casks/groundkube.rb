cask "groundkube" do
  version "0.2.0"

  url "https://downloads.grindkube.com/releases/v0.2.0/GroundKube_0.2.0_aarch64.dmg"
  sha256 "a14b047228dd399e44dc4b8aac107c599c9364741dfbe65ac98ceaa5f6552939"

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
