cask "grindkube" do
  version "0.2.2"

  url "https://downloads.grindkube.com/releases/v0.2.2/GrindKube_0.2.2_aarch64.dmg"
  sha256 "416f07b406fbe294930124be7870b7d37a619ad505f9dc5e848c560afa35ad9c"

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
