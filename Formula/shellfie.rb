class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.4/shellfie-darwin-arm64.tar.gz"
      sha256 "f5b0cc6bd5b72a86a0432cdb272ccb71b7cb9adf04bb8fa3d41122db258a9275"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.4/shellfie-darwin-x64.tar.gz"
      sha256 "548c1c9639309b63ad4be31752d3727a93c1fe7e6137ec695a9b6bce3aa3a473"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.4/shellfie-linux-arm64.tar.gz"
      sha256 "4a16d2d5258e1895b64336438b6ad206366ca799d3a1413e7c3522cec5b0ae63"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.4/shellfie-linux-x64.tar.gz"
      sha256 "6a1e88ef69ab7ad8de062fcde1bbfa10647d70c7f8887c6785a8a57fd98c6a83"
    end
  end

  def install
    if Hardware::CPU.arm?
      if OS.mac?
        bin.install "shellfie-darwin-arm64" => "shellfie"
      else
        bin.install "shellfie-linux-arm64" => "shellfie"
      end
    else
      if OS.mac?
        bin.install "shellfie-darwin-x64" => "shellfie"
      else
        bin.install "shellfie-linux-x64" => "shellfie"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shellfie --version")
  end
end
