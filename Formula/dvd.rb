class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd-cli"
  version "1.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.4.1/dvd-darwin-arm64.tar.gz"
      sha256 "157ec7c6f452cdef198c289f7a4671ff86347496138fecbaa3fb4026fdfb44af"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.4.1/dvd-darwin-x64.tar.gz"
      sha256 "686d3b59fa46eaccedcc6011aec3ae1a988ffcd67d3aa4b95dc595a3cabfff90"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.4.1/dvd-linux-arm64.tar.gz"
      sha256 "6eb779a7ac21c936ef586e9ce7d3a5b41a05be99d911db6ff9f2ca895200d578"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.4.1/dvd-linux-x64.tar.gz"
      sha256 "4f35e104259034622331b31329148f9751f0b10e111cd6bd3d912379df482e9a"
    end
  end

  def install
    if Hardware::CPU.arm?
      if OS.mac?
        bin.install "dvd-darwin-arm64" => "dvd"
      else
        bin.install "dvd-linux-arm64" => "dvd"
      end
    else
      if OS.mac?
        bin.install "dvd-darwin-x64" => "dvd"
      else
        bin.install "dvd-linux-x64" => "dvd"
      end
    end
  end

  test do
    assert_match "dvd", shell_output("#{bin}/dvd --version")
  end
end
