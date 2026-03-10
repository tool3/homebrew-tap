class Shellfie < Formula
  desc "Transform terminal output into beautiful SVGs"
  homepage "https://github.com/tool3/shellfie-cli"
  version "VERSION_PLACEHOLDER"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/vVERSION_PLACEHOLDER/shellfie-darwin-arm64.tar.gz"
      sha256 "SHA_ARM64_PLACEHOLDER"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/vVERSION_PLACEHOLDER/shellfie-darwin-x64.tar.gz"
      sha256 "SHA_X64_PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/vVERSION_PLACEHOLDER/shellfie-linux-arm64.tar.gz"
      sha256 "SHA_LINUX_ARM64_PLACEHOLDER"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/vVERSION_PLACEHOLDER/shellfie-linux-x64.tar.gz"
      sha256 "SHA_LINUX_X64_PLACEHOLDER"
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
    assert_match "shellfie", shell_output("#{bin}/shellfie --version")
  end
end
