class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.19/shellfie-darwin-arm64.tar.gz"
      sha256 "2fd01fe1203fd5f8de2a11fc1b63e9ea7dc9643daa13ef766c32caa48b865fc6"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.19/shellfie-darwin-x64.tar.gz"
      sha256 "0df5068ff277467f0210c43c89f73a2dd48d8cb968e97951042eff230c339b09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.19/shellfie-linux-arm64.tar.gz"
      sha256 "d18f0b9f6ea9ceba1702827cb0b0010e4b12e17c9b9d2f0bf88b4a7029879b88"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.19/shellfie-linux-x64.tar.gz"
      sha256 "16c59f537c5ca76d9d07585debe43ea7e348b1e3bbc9c3fc36f46b07272c88d8"
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
