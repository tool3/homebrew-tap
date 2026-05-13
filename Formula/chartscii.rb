class Chartscii < Formula
  desc "Create beautiful ascii charts"
  homepage "https://github.com/tool3/chartscii-cli"
  version "4.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/chartscii/releases/download/v4.0.3/chartscii-darwin-arm64.tar.gz"
      sha256 "686d65201f12637395beeb46958de95f8d14cbeb03f9455830de5658f711e8fe"
    else
      url "https://github.com/tool3/chartscii/releases/download/v4.0.3/chartscii-darwin-x64.tar.gz"
      sha256 "72f9a9b80e23b91f11092bd26d3ba6fe2da776f20f1e8063209c19777db9e1f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/chartscii/releases/download/v4.0.3/chartscii-linux-arm64.tar.gz"
      sha256 "a6d91689a947381a9c4832d738f1556fa1d2a77dc937b2b40122020ac810fe06"
    else
      url "https://github.com/tool3/chartscii/releases/download/v4.0.3/chartscii-linux-x64.tar.gz"
      sha256 "c9d0807509d9b9942812c66d998302ff605339360f4a8c422e8eb7edfe5b2cf9"
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
