cask "fefe" do
  arch arm: "arm64", intel: "x64"

  version "1.1.1"
  sha256 arm:   "2acca7bd14c1521b0bc14ac759747987df2a40aac693496ee5800056548e1a40
b44dfd68c22b6ec5464ed680b8bcc0d323a60026234fbc86959332108b97d817",
         intel: "d0607e0b96e0d1e6cfa15da3235ac09ae2ac15f9ec8d6b7fe91a05f3de4acc50
0fea1944c98a2952c9acdd0302fae00b5749619f689f30340dab289a1c70aed2"

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
