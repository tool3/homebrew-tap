class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd-cli"
  version "1.0.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.17/dvd-darwin-arm64.tar.gz"
      sha256 "309968b72cbd440f947734f2fdf88d292d6fffa28709d55b716de680cffc5c7b"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.17/dvd-darwin-x64.tar.gz"
      sha256 "3b3af35e5d130eb2820cb909719e480e3c91834cf4e3283d681e99ccd423595c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.17/dvd-linux-arm64.tar.gz"
      sha256 "9ec40939a4ed367e42cce47cc117a510d78f14d99ea80dd7ad36c783a0b1a755"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.17/dvd-linux-x64.tar.gz"
      sha256 "ec8f6bc4ffc58fb5c96ad5b93594ce70f4067e38658a19388c0de82ccdc4296f"
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
