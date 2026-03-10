class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.16/shellfie-darwin-arm64.tar.gz"
      sha256 "3f33030bb9fec4116a72ff9b3cd85890dce486758ff31bd1d7da44a174a3e716"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.16/shellfie-darwin-x64.tar.gz"
      sha256 "9bc5ec5f2f95c8f692fabf7b66d90bd9b6a637b25832b648e4aacd0a3df867e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.16/shellfie-linux-arm64.tar.gz"
      sha256 "8d239fbaab7b746dc5968e5811884037e1a64a2129250fa1484318179054707b"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.16/shellfie-linux-x64.tar.gz"
      sha256 "487a94a146291b32b9ecfd6b560f226f72d08102434982a57d09192aed49adaa"
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
