class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.1.2/shellfie-darwin-arm64.tar.gz"
      sha256 "ad43a4f94c742a2cb26619aa2805f834e51e251f478f19fb37c751d504b889e7"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.1.2/shellfie-darwin-x64.tar.gz"
      sha256 "b00b6e1516f46903eda35acfa11776eb2f917e697c1ab434af276ae54d19a93a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.1.2/shellfie-linux-arm64.tar.gz"
      sha256 "7651720df5256d159f38826f4236389199f25e907500269b359c811437c516fb"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.1.2/shellfie-linux-x64.tar.gz"
      sha256 "35f18b0189a3e62f18732a072f6645a90fce23d63874c71c2464b7325cde27c4"
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
