class Chartscii < Formula
  desc "Create beautiful ascii charts"
  homepage "https://github.com/tool3/chartscii-cli"
  version "4.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/chartscii/releases/download/v4.0.2/chartscii-darwin-arm64.tar.gz"
      sha256 "a5483c5a4c223a7e6c5ca18b99e71d46e6bedfecb8721e8df9d831b84b767de9"
    else
      url "https://github.com/tool3/chartscii/releases/download/v4.0.2/chartscii-darwin-x64.tar.gz"
      sha256 "2c13906edd4bff89171d52ccb1ddaddd07252cb77503e8127a3a9a70019cf75e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/chartscii/releases/download/v4.0.2/chartscii-linux-arm64.tar.gz"
      sha256 "fa3a79ee7e26ced5d7d7838706f3cda41b2b1ee190be8091c70c6ad97f22fc9e"
    else
      url "https://github.com/tool3/chartscii/releases/download/v4.0.2/chartscii-linux-x64.tar.gz"
      sha256 "2eff743a5c9225f9a87d271488625fe5ad58daf4c488a3157a03cdf13847d667"
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
