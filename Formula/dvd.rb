class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd-cli"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.4.0/dvd-darwin-arm64.tar.gz"
      sha256 "a25525657912b5db7e82e8fc8d0012441ac0a7350fd8b6b67b3737de0598df51"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.4.0/dvd-darwin-x64.tar.gz"
      sha256 "ce4ebe6edb88c57c650601891221242c3cdc590720ea933282c0ce6efb11f74b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.4.0/dvd-linux-arm64.tar.gz"
      sha256 "7a77eef3177ba025ab2c7ee1e5e32e168db2a723bd2e6e5dc610b01bf84885a0"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.4.0/dvd-linux-x64.tar.gz"
      sha256 "7e02efa070c33a699af7d0fa8bea473e80ab48a66cf1e6a9de2db7ad859b7bca"
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
