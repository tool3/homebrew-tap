class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd-cli"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.2.0/dvd-darwin-arm64.tar.gz"
      sha256 "1d0364b34ef810a4e67fca6ab682db5a95c523c1d8205f4984fe5b1880cb2999"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.2.0/dvd-darwin-x64.tar.gz"
      sha256 "83778170f16562cadbb9594916688e374d5a1bcbc7a07ec61c50fe7594bc4cc3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.2.0/dvd-linux-arm64.tar.gz"
      sha256 "4126783f24ecaa072356db0c55d206ea8601600c75b8a335e37eb670213fa54c"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.2.0/dvd-linux-x64.tar.gz"
      sha256 "110903ea9ba0f2072e11cc4a6f8a142744ba75175c88c9c58bc857ca809e3875"
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
