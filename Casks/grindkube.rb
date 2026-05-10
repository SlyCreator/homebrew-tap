cask "grindkube" do
  version "0.2.4"

  url "https://downloads.grindkube.com/releases/v0.2.4/GrindKube_0.2.4_aarch64.dmg"
  sha256 "0d2435f436df74b15ccf8d60ce1be64b1fe3771747016a902a70c2d3f9a47546"

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
