class Shellfie < Formula
  desc "Transform terminal output into beautiful SVGs"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.4/shellfie-darwin-arm64.tar.gz"
      sha256 "9ba3a29e315d8ddb01222acc2a83d274527287095529800b16b80c762db5892a"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.4/shellfie-darwin-x64.tar.gz"
      sha256 "1533700a65322b513bbcb9add2c6b529a8c1220284d60714423ef9070b255152"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.4/shellfie-linux-arm64.tar.gz"
      sha256 "61a7ca51dcdbf9e0b42270d49835fc7ce80fdb5ed9cb6c6c7be274e72ea587b8"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.4/shellfie-linux-x64.tar.gz"
      sha256 "7e47cdf27b551d7e354967f97be0c29359e1f767cb7125dd35f381c35bef7960"
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
