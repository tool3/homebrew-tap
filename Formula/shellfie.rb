class Shellfie < Formula
  desc "Transform terminal output into beautiful SVGs"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.3/shellfie-darwin-arm64.tar.gz"
      sha256 "59657bcd29cbb55427738abfc5a80b80ac7884872f7fdd72e099c4b64810a9d2"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.3/shellfie-darwin-x64.tar.gz"
      sha256 "51d2b4893fd3bc301e721b42e1faa2c1450a72a47011824731f6903b2b758021"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.3/shellfie-linux-arm64.tar.gz"
      sha256 "054219e08fdb67ffdd2f2d7af19f5592d892266979c4373288d14e51e4a90e28"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.3/shellfie-linux-x64.tar.gz"
      sha256 "a454a09e5be6712df68d4f59e1097813249afd700d3d4a5d1ca613842142f8d4"
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
