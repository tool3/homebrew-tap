class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd-cli"
  version "1.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.10/dvd-darwin-arm64.tar.gz"
      sha256 "a672262c62cb63374adfc700aee1af40087ed62e772118de185675ec2e3634d4"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.10/dvd-darwin-x64.tar.gz"
      sha256 "b5f918a14ea95a14a7dedda1705858170771ec555e92865bed451b6153f76959"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.10/dvd-linux-arm64.tar.gz"
      sha256 "2e2cf8f6020e2d74ee7dea5b893915ecb1db00d0aa4ed75c272e9f87b9957bb2"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.10/dvd-linux-x64.tar.gz"
      sha256 "024491307ea6c8577eba6da49c34ab7dfae4395ffc92d7283c250c57ca63cf83"
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
