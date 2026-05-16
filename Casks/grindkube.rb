cask "grindkube" do
  version "0.3.10"

  url "https://downloads.grindkube.com/releases/v0.3.10/GrindKube_0.3.10_aarch64.dmg"
  sha256 "d7e69ac7a53bbbc2354b00d6a6f8554ad4c4467b2ce77fa858a6a1630803a545"

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
