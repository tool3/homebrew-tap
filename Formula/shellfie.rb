class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.14/shellfie-darwin-arm64.tar.gz"
      sha256 "a56551fa6532d7b9004c69a53fa0dddb28c8904d5ad6632274c766c1e1b873f6"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.14/shellfie-darwin-x64.tar.gz"
      sha256 "3835d5175d9aa8d4afa6bafdfa67367c616de3f095d837dd4e7bc055f8e2632c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.14/shellfie-linux-arm64.tar.gz"
      sha256 "5a8e3daa1f34e485a66b837ed3455147d91867ca00de5d46d6befb1d98b24c24"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.14/shellfie-linux-x64.tar.gz"
      sha256 "a68c11074b5dbb9391a51bc3a7de42b0d7dd07cc99740edfbe00f0da83dd0ca4"
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
