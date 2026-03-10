class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.15/shellfie-darwin-arm64.tar.gz"
      sha256 "2b5d50bc0a54bac8ed421ae79bc5801c8b306fa7ae3b3fca9e2f04154c42bf0d"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.15/shellfie-darwin-x64.tar.gz"
      sha256 "40a8081185cfacb5230e097f3e3bba0aeaa02b84ad7d9d3491f8e3a8f63b8708"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.15/shellfie-linux-arm64.tar.gz"
      sha256 "872970b2b8c606a2a57a24a0d5e677d57de5a74b08f5149562feca5172b2bd9d"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.15/shellfie-linux-x64.tar.gz"
      sha256 "6667e70cfda3e6a236b8908109aaf786b19820747171f494335fe1a444de95a3"
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
