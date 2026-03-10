class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.7/shellfie-darwin-arm64.tar.gz"
      sha256 "e67fc91f0eb715b446bed800c02dff279553277101ddd1f60d36f6d55b4633cd"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.7/shellfie-darwin-x64.tar.gz"
      sha256 "75c02b4002c8b72837f482e7556c63079c4476cd91e1e323a066a7d88658ca40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.7/shellfie-linux-arm64.tar.gz"
      sha256 "5189d887133bfd040229c6a65f5b36a3209d5d29d1a5b31c892d6b49546df29f"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.7/shellfie-linux-x64.tar.gz"
      sha256 "1f5dfdc5376f343226a392f62f0a2a95932e34663ec48803406ff90432c979fe"
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
