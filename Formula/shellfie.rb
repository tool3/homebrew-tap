class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.2.0/shellfie-darwin-arm64.tar.gz"
      sha256 "7ed83b9833d6b51d91a282d3da23f67b6d2bb5a165854514c156643251a73bd5"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.2.0/shellfie-darwin-x64.tar.gz"
      sha256 "d7b442d3d437dea4dd1cad66fdeafca786c6359ee1ab381b22f7691982bd7abb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.2.0/shellfie-linux-arm64.tar.gz"
      sha256 "77cf197c504a922116e9528815acde49213aa1334bf452319f76f79b7d2f3eda"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.2.0/shellfie-linux-x64.tar.gz"
      sha256 "f07cb2c97e822a5113a61ecefd0a63d0b165d8abf713a2bd86a99ad20f6c410f"
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
