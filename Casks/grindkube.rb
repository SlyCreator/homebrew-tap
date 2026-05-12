cask "grindkube" do
  version "0.2.7"

  url "https://downloads.grindkube.com/releases/v0.2.7/GrindKube_0.2.7_aarch64.dmg"
  sha256 "9c1864faad474b74490c18dcf7a96300df0e8354c1a66c24c044c7dfc85370a9"

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
