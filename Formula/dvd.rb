class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd"
  version "VERSION_PLACEHOLDER"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/vVERSION_PLACEHOLDER/dvd-darwin-arm64.tar.gz"
      sha256 "SHA_ARM64_PLACEHOLDER"
    else
      url "https://github.com/tool3/dvd/releases/download/vVERSION_PLACEHOLDER/dvd-darwin-x64.tar.gz"
      sha256 "SHA_X64_PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/vVERSION_PLACEHOLDER/dvd-linux-arm64.tar.gz"
      sha256 "SHA_LINUX_ARM64_PLACEHOLDER"
    else
      url "https://github.com/tool3/dvd/releases/download/vVERSION_PLACEHOLDER/dvd-linux-x64.tar.gz"
      sha256 "SHA_LINUX_X64_PLACEHOLDER"
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
