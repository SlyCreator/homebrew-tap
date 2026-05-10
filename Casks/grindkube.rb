cask "grindkube" do
  version "0.2.5"

  url "https://downloads.grindkube.com/releases/v0.2.5/GrindKube_0.2.5_aarch64.dmg"
  sha256 "95a918c0d2714338cf13fc35b0c5371f1bf644355a398cd3ef70d4c626cd458c"

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
