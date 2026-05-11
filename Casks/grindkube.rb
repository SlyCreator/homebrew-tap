cask "grindkube" do
  version "0.2.6"

  url "https://downloads.grindkube.com/releases/v0.2.6/GrindKube_0.2.6_aarch64.dmg"
  sha256 "cf36548fa6378885d9d0e95cb2acf0e69c7786534fdfd0a89991632fcfa4adc4"

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
