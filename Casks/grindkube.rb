cask "grindkube" do
  version "0.2.3"

  url "https://downloads.grindkube.com/releases/v0.2.3/GrindKube_0.2.3_aarch64.dmg"
  sha256 "af3ec7c10fecf0e71890bda863695e485a48bbf4901e2e1d6c8fcd397fa0cf2b"

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
    "~/Library/Application Support/dev.groundkube.app",
    "~/Library/Caches/dev.groundkube.app",
    "~/Library/Preferences/dev.groundkube.app.plist",
  ]
end
