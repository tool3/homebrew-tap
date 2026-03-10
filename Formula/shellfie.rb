class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.18/shellfie-darwin-arm64.tar.gz"
      sha256 "fbf007684edf198742f6334f0dab1d0782ef881afc99f043ec5eb900d92b4914"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.18/shellfie-darwin-x64.tar.gz"
      sha256 "0cfde5dab4715865f4882fc3fb04125517041afe3d8e34d326a9bc385675e066"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.18/shellfie-linux-arm64.tar.gz"
      sha256 "24c28635a51bd9c066305d38824054b911dff9040788bf013e6937043ffaa54b"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.18/shellfie-linux-x64.tar.gz"
      sha256 "f0eb33bbd5be32b100de3ebf3035f6dea9b3221f623157d89e432c39a1865889"
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
