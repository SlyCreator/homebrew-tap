cask "grindkube" do
  version "0.3.5"

  url "https://downloads.grindkube.com/releases/v0.3.5/GrindKube_0.3.5_aarch64.dmg"
  sha256 "3ebafe1d7563d224fe27b213e2a240e10d4fdfa287c9cb4013fdd3613c16bc50"

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
