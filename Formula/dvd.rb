class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd-cli"
  version "1.0.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.11/dvd-darwin-arm64.tar.gz"
      sha256 "872bdcd702c68ad14bb1231f426b6ed0716a1235d04dac45872bb9258d12bfee"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.11/dvd-darwin-x64.tar.gz"
      sha256 "5db4ba5213d1cd82cfa838e52d87c79315d33650397aed3fc5576c46de586c11"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.11/dvd-linux-arm64.tar.gz"
      sha256 "6c1fa79349c7f69d901929a881955ffa3a0df0310d9f488d3b2baf07eae17322"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.11/dvd-linux-x64.tar.gz"
      sha256 "13779202ea32f5555149a6e7fd1c27972fae6f219cb43635121e9fc18b1395d3"
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
