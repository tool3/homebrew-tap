class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd-cli"
  version "1.0.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.16/dvd-darwin-arm64.tar.gz"
      sha256 "47dc8bab1349b34aa059080809bb7dce83f080d455f380de584dad689c027168"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.16/dvd-darwin-x64.tar.gz"
      sha256 "74b187d6fc17605d6935462691a20edc8c6b7b3342b51fc2bc123c0a6677d297"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.16/dvd-linux-arm64.tar.gz"
      sha256 "6442098bfb1e52fd6e69f625c4093eff96acf2f20a75868b62f2ac48bc7342bb"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.16/dvd-linux-x64.tar.gz"
      sha256 "1bd1bd6bf42c3c5f6adff7791e5c81197ed54ced2e03669852fde808fa7923cd"
    end
  end

  def install
    if Hardware::CPU.arm?
      if OS.mac?
        bin.install "dvd-darwin-arm64" => "dvd"
      else
        bin.install "dvd-linux-arm64" => "dvd"
      end
    else
      if OS.mac?
        bin.install "dvd-darwin-x64" => "dvd"
      else
        bin.install "dvd-linux-x64" => "dvd"
      end
    end
  end

  test do
    assert_match "dvd", shell_output("#{bin}/dvd --version")
  end
end
