class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd-cli"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.3.0/dvd-darwin-arm64.tar.gz"
      sha256 "bc67fdaafdf448744d89b168f38ad00e2f9570e0fcfa60b5b200f7ae0c3e4c15"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.3.0/dvd-darwin-x64.tar.gz"
      sha256 "3b573bdf3598d30f3cce52958e8966a51b677d0877be93b53c20cc59fa1797a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.3.0/dvd-linux-arm64.tar.gz"
      sha256 "8dedc67b2d44e9eb8d9951a12fc4a722114cd53dd671ef47353a1bee3bf710a8"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.3.0/dvd-linux-x64.tar.gz"
      sha256 "7276aad80ae71ccd5018a7e0a39e82ee86fb12a6191930a42caa45fa5319ee60"
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
