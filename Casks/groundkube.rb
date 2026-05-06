cask "groundkube" do
  version "0.1.0"

  url "https://github.com/SlyCreator/groundkube-desktop/releases/download/v#{version}/GroundKube_#{version}_aarch64.dmg"
  sha256 "placeholder_updated_on_release"

  depends_on arch: :arm64

  name "GroundKube"
  desc "Local Kubernetes practice labs — no cloud, no session limits"
  homepage "https://grindkube.com"

  depends_on macos: ">= :ventura"

  app "GroundKube.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/GroundKube.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/dev.groundkube.app",
    "~/Library/Caches/dev.groundkube.app",
    "~/Library/Preferences/dev.groundkube.app.plist",
  ]
end
