class Shellfie < Formula
  desc "Transform terminal output into beautiful SVGs"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.3.0/shellfie-darwin-arm64.tar.gz"
      sha256 "125db2f904fcb897918d9a0e715422c35eeb47c60065e6fa17ce28e0ce029b07"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.3.0/shellfie-darwin-x64.tar.gz"
      sha256 "98eea4e1f7e03f8a866903ee35ee707b4d6c65c4d2220bb2d4ea63afdd3af987"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.3.0/shellfie-linux-arm64.tar.gz"
      sha256 "662e58e794ffcd54bbaecbbef5ce5f99dff7428870aa7a27b445ac5e28e5c806"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.3.0/shellfie-linux-x64.tar.gz"
      sha256 "33ee97e6356ef71b2ffabed49c284008326d3be732e829fb0bb040a7da9812f1"
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
