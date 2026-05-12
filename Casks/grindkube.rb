cask "grindkube" do
  version "0.3.7"

  url "https://downloads.grindkube.com/releases/v0.3.7/GrindKube_0.3.7_aarch64.dmg"
  sha256 "27de1954be1cedbedb1a12d7e22215078a933dd7729c895a80bc47f8be3cf62b"

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
