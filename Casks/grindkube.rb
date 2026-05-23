cask "grindkube" do
  version "0.3.14"

  url "https://downloads.grindkube.com/releases/v0.3.14/GrindKube_0.3.14_aarch64.dmg"
  sha256 "98ab8975b67603e066292120316527012fd941c5f458419864352cc364b551a5"

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
