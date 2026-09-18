class Shellfie < Formula
  desc "Transform terminal output into beautiful SVGs"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.5.3/shellfie-darwin-arm64.tar.gz"
      sha256 "f0545d8a4ba53d1a5c15bbcbe0fca2dca43ee47867326a931f0ea3d5aac16d60"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.5.3/shellfie-darwin-x64.tar.gz"
      sha256 "264bd7a853af8590cf0dae941e969548639ba5621139d542a54680c0a6ac0168"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.5.3/shellfie-linux-arm64.tar.gz"
      sha256 "808af9a8c56a4b9e560dc79aeaf089cb570023ed3aaa5fefed8f9c596105e993"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.5.3/shellfie-linux-x64.tar.gz"
      sha256 "9e4ed07d9fcda58873c53f61c132f0dfc81fdf1097ed29c701ea6dc4fc980c95"
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
