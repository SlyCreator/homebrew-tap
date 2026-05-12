cask "grindkube" do
  version "0.2.8"

  url "https://downloads.grindkube.com/releases/v0.2.8/GrindKube_0.2.8_aarch64.dmg"
  sha256 "fae8cd07f2122343181495ebb38fdb4587ee28666adbebba0b08d5dcdef2916c"

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
