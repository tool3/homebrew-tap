cask "fefe" do
  arch arm: "arm64", intel: "x64"

  version "VERSION_PLACEHOLDER"
  sha256 arm:   "0000000000000000000000000000000000000000000000000000000000000000",
         intel: "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/tool3/fefe/releases/download/v#{version}/Fefe-#{version}-#{arch}.dmg"
  name "Fefe"
  desc "Desktop UI for ffmpeg — inspect, convert, and trim media"
  homepage "https://github.com/tool3/fefe"

  app "Fefe.app"

  zap trash: [
    "~/Library/Application Support/Fefe",
    "~/Library/Preferences/com.synectmedia.fefe.plist",
    "~/Library/Saved Application State/com.synectmedia.fefe.savedState",
    "~/Library/Logs/Fefe",
  ]
end
