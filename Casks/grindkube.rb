cask "grindkube" do
  version "0.3.2"

  url "https://downloads.grindkube.com/releases/v0.3.2/GrindKube_0.3.2_aarch64.dmg"
  sha256 "cf3056137d5daca7eee79e976f57acd5884d6000699801079eca02d8b5c38bb8"

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
