class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.17/shellfie-darwin-arm64.tar.gz"
      sha256 "afc9b5401871dc9734aea292c01a479acd3f232d248f49d757b5b07acd2fc28e"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.17/shellfie-darwin-x64.tar.gz"
      sha256 "50168960c0234966841aadf06c24993cb0410398ce5f46c064210aa50ea32fd9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.17/shellfie-linux-arm64.tar.gz"
      sha256 "e9b02386b82778a5abda6ca3094f14f59c241db68cb1133c587e96d5a86d13cf"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.17/shellfie-linux-x64.tar.gz"
      sha256 "5a78d87cb612ec4c1a07998979ff1f3230ba3b3eeb0d1bb70895fd4b3f83bd7e"
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
