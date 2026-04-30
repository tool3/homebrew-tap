class Shellfie < Formula
  desc "Transform terminal output into beautiful SVGs"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.2/shellfie-darwin-arm64.tar.gz"
      sha256 "c99d45689af3b8a7b4d2ca4f19acb2bcc311ce7221c8a54d21bd8cf7b6c938be"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.2/shellfie-darwin-x64.tar.gz"
      sha256 "2251ffb7cd73035a7f600e8c78d057e9720cd2dc841d1f7a69a68760db1a6490"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.2/shellfie-linux-arm64.tar.gz"
      sha256 "bed2c1d352c0b3af831f3a6aa5b30c8cbf347dea6e0840fdf7712b5bd5a9f5b3"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.2/shellfie-linux-x64.tar.gz"
      sha256 "6b34439ee2e9c9dcb296a4deaa41a840c76d2f1b4d8d14c52907244fb1f0deb2"
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
