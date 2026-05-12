cask "grindkube" do
  version "0.3.4"

  url "https://downloads.grindkube.com/releases/v0.3.4/GrindKube_0.3.4_aarch64.dmg"
  sha256 "519d4bec17c7cfaf6f8fe1809c286adefc1e6fa9c67b303e4f6044c6c8e82555"

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
