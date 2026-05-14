class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd-cli"
  version "1.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.12/dvd-darwin-arm64.tar.gz"
      sha256 "e08f6a640887e0c8f8bca53bd078a2d513fe6bc56aff7177e1f96aafead44c52"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.12/dvd-darwin-x64.tar.gz"
      sha256 "26900ccbf52a0fd98f55a1af5f7ca5d825cfc6b1e57b25bdd7c52d4d256f8322"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.12/dvd-linux-arm64.tar.gz"
      sha256 "70a799d172d7b78b4931c96b3f3ebf8bab3cbb5eee2debac3d3a5f5c5730848b"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.12/dvd-linux-x64.tar.gz"
      sha256 "de76bed239d5308ff20718cdd3d02efb543ec55ec44f5cdc9386c9496c241eb6"
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
