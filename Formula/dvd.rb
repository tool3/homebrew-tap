class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd-cli"
  version "1.0.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.13/dvd-darwin-arm64.tar.gz"
      sha256 "deb4de94d2dfeddc0e3c6537d17344f04804eca75238f61d5b93dd68535ca9e7"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.13/dvd-darwin-x64.tar.gz"
      sha256 "06eed97fc79ac936c93a9e7d970c162ed177914210f0a3fb77c37d38bfd66ede"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.13/dvd-linux-arm64.tar.gz"
      sha256 "81a2ef3ed91e32313925195b0b992bab1d4233bf0d8dd54e6c7b3f0108f60d4d"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.13/dvd-linux-x64.tar.gz"
      sha256 "d5ef3d72cc9f12ecfaee3d269538456ca2a4337ba649444ff58bb2185e6c73c8"
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
