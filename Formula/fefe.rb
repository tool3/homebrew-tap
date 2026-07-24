class Fefe < Formula
  desc "Front End for ffmpeg"
  homepage "https://github.com/tool3/fefe"
  version "VERSION_PLACEHOLDER"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/fefe/releases/download/vVERSION_PLACEHOLDER/fefe-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/tool3/fefe/releases/download/vVERSION_PLACEHOLDER/fefe-darwin-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/fefe/releases/download/vVERSION_PLACEHOLDER/fefe-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/tool3/fefe/releases/download/vVERSION_PLACEHOLDER/fefe-linux-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    if Hardware::CPU.arm?
      if OS.mac?
        bin.install "fefe-darwin-arm64" => "fefe"
      else
        bin.install "fefe-linux-arm64" => "fefe"
      end
    else
      if OS.mac?
        bin.install "fefe-darwin-x64" => "fefe"
      else
        bin.install "fefe-linux-x64" => "fefe"
      end
    end
  end

  test do
    assert_match "fefe", shell_output("#{bin}/fefe --version")
  end
end
