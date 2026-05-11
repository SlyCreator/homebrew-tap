cask "grindkube" do
  version "0.2.6"

  url "https://downloads.grindkube.com/releases/v0.2.6/GrindKube_0.2.6_aarch64.dmg"
  sha256 "64f002574d8cd7dda441a248c312f6a1db53de39b6671b9ee4a78cb0e369f2e4"

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
