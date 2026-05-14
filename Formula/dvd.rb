class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd-cli"
  version "1.0.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.15/dvd-darwin-arm64.tar.gz"
      sha256 "69d8f610a74927811824b798078cd75b8175bd593733d47b9b90131a5d986b08"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.15/dvd-darwin-x64.tar.gz"
      sha256 "4b34a38605bd9f8a428b2da2e6ee58e920b4db6edb7182d6f6025a48712e7400"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.15/dvd-linux-arm64.tar.gz"
      sha256 "e805742601087fb8c2bd7511f8e9426443a6bf9ce38e823d16c3d586e095322a"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.15/dvd-linux-x64.tar.gz"
      sha256 "c6109c58cc0a06942bd6a0243866938b4ae48b3998787bad43c0e67199a07785"
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
