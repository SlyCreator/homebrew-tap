cask "grindkube" do
  version "0.3.3"

  url "https://downloads.grindkube.com/releases/v0.3.3/GrindKube_0.3.3_aarch64.dmg"
  sha256 "1c5f7ab2994de6cb160d908199677ee172211ac17467d484ee9edd02939db18b"

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
