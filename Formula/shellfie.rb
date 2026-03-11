class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.20/shellfie-darwin-arm64.tar.gz"
      sha256 "9b909cfb2c7336678896bc6a349ced27391bb0743e898fd54c18bdc09d0eebb9"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.20/shellfie-darwin-x64.tar.gz"
      sha256 "e452ffc9563263302da9fc153f06d4f25ac190819b75f5817e38b791f2eb5d1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.20/shellfie-linux-arm64.tar.gz"
      sha256 "1ba7e5ea6702dd43c00f9a13cd0897f4276445f5467f99b6d70ed1102e412d90"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.20/shellfie-linux-x64.tar.gz"
      sha256 "4436264ea2edc1a96a1961e5f49a6e8dbe939108660be0c37d3d4c6ae4ba0f4a"
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
