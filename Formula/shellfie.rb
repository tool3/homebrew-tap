class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.5/shellfie-darwin-arm64.tar.gz"
      sha256 "175ef46776005e678a205a58eb0f3fb4eb673b1c37aa9812bca0bdc705d816f7"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.5/shellfie-darwin-x64.tar.gz"
      sha256 "0e1b10e3bc997e9f4205c96afc46caab0270a226e385a141a2380984fe55f263"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.5/shellfie-linux-arm64.tar.gz"
      sha256 "67d67213f85d65898b550e4397b627233fc0f77a8f2a686c5756ad947d7ff253"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.5/shellfie-linux-x64.tar.gz"
      sha256 "fa12991b8ba666011b407f1d598eae59c071c8cddfef09c79d588b2a15be164f"
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
