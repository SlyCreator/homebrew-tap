cask "grindkube" do
  version "0.2.9"

  url "https://downloads.grindkube.com/releases/v0.2.9/GrindKube_0.2.9_aarch64.dmg"
  sha256 "a4ee9836e6825110c6e4eaeb0ea4701905fcb9409533847d001839812ff6ba83"

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
