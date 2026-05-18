cask "grindkube" do
  version "0.3.11"

  url "https://downloads.grindkube.com/releases/v0.3.11/GrindKube_0.3.11_aarch64.dmg"
  sha256 "b404300097618503c9915fbd3614aca6d16c839645c5bb3392a0cf8b39482ba9"

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
