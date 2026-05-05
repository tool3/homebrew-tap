class Chartscii < Formula
  desc "Create beautiful ascii charts"
  homepage "https://github.com/tool3/chartscii-cli"
  version "VERSION_PLACEHOLDER"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/chartscii/releases/download/vVERSION_PLACEHOLDER/chartscii-darwin-arm64.tar.gz"
      sha256 "SHA_ARM64_PLACEHOLDER"
    else
      url "https://github.com/tool3/chartscii/releases/download/vVERSION_PLACEHOLDER/chartscii-darwin-x64.tar.gz"
      sha256 "SHA_X64_PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/chartscii/releases/download/vVERSION_PLACEHOLDER/chartscii-linux-arm64.tar.gz"
      sha256 "SHA_LINUX_ARM64_PLACEHOLDER"
    else
      url "https://github.com/tool3/chartscii/releases/download/vVERSION_PLACEHOLDER/chartscii-linux-x64.tar.gz"
      sha256 "SHA_LINUX_X64_PLACEHOLDER"
    end
  end

  def install
    if Hardware::CPU.arm?
      if OS.mac?
        bin.install "chartscii-darwin-arm64" => "chartscii"
      else
        bin.install "chartscii-linux-arm64" => "chartscii"
      end
    else
      if OS.mac?
        bin.install "chartscii-darwin-x64" => "chartscii"
      else
        bin.install "chartscii-linux-x64" => "chartscii"
      end
    end
  end

  test do
    assert_match "chartscii", shell_output("#{bin}/chartscii --version")
  end
end
