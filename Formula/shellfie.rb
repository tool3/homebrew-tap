class Shellfie < Formula
  desc "Transform terminal output into beautiful SVGs"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.1/shellfie-darwin-arm64.tar.gz"
      sha256 "c64276c98753651848358f8d5b981eca5f9bcd0252defc421962eeb5ec2c7d4d"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.1/shellfie-darwin-x64.tar.gz"
      sha256 "c2cb58815a1bcaff8fab3f3ac6a5284ae41dd6e1aa83978f324b0b3c946029ca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.1/shellfie-linux-arm64.tar.gz"
      sha256 "2330b013524f5305051212565ec4835e3454cf7543ad98a97ad6adad0e079ba3"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.1/shellfie-linux-x64.tar.gz"
      sha256 "8bff22aab64a89559fd601bed557af7873b01c39e99eed1e54c1f10b4f51f948"
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
