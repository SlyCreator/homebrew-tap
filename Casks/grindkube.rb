cask "grindkube" do
  version "0.2.7-rc2"

  url "https://downloads.grindkube.com/releases/v0.2.7-rc2/GrindKube_0.2.7-rc2_aarch64.dmg"
  sha256 "07edd9286478a9279b17d734234d75bbd10a128b5801f91a8dbe41273921793f"

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
