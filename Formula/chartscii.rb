class Chartscii < Formula
  desc "Create beautiful ascii charts"
  homepage "https://github.com/tool3/chartscii-cli"
  version "VERSION_PLACEHOLDER"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/chartscii/releases/download/vVERSION_PLACEHOLDER/chartscii-darwin-arm64.tar.gz"
      sha256 "e2382d400e988686678f73b969ec91139a5d1ebc603fc8f319490440d8e6cd0c"
    else
      url "https://github.com/tool3/chartscii/releases/download/vVERSION_PLACEHOLDER/chartscii-darwin-x64.tar.gz"
      sha256 "3008f724b3f033b74d02305b37c689b03b265e0c137cf49528abc71b1cc8de09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/chartscii/releases/download/vVERSION_PLACEHOLDER/chartscii-linux-arm64.tar.gz"
      sha256 "866db7357fb9b05b227825edd023f7826fa3314cfaa478bce3692367c3743167"
    else
      url "https://github.com/tool3/chartscii/releases/download/vVERSION_PLACEHOLDER/chartscii-linux-x64.tar.gz"
      sha256 "481bd43645350ba1b8ef0e4a3ee36851a5fa1a7a5bea31340c165582b859b924"
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
