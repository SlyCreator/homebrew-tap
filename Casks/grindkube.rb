cask "grindkube" do
  version "0.3.0"

  url "https://downloads.grindkube.com/releases/v0.3.0/GrindKube_0.3.0_aarch64.dmg"
  sha256 "664bde26032b3c455d02b8dc34e4d1b031b50d2ab5ee13bb8c231dadc7a48b4d"

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
