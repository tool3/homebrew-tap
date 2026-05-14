class Dvd < Formula
  desc "Create beautiful animated SVGs"
  homepage "https://github.com/tool3/dvd-cli"
  version "1.0.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.14/dvd-darwin-arm64.tar.gz"
      sha256 "5bef53932d72118ff9e93b2d71f6f562bfe51004acad72aadc4f221e0d867c15"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.14/dvd-darwin-x64.tar.gz"
      sha256 "37a274ad3f1d81fa91783ea0af110f0d3e945839e8259a9ad26538b3f60de8b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/dvd/releases/download/v1.0.14/dvd-linux-arm64.tar.gz"
      sha256 "1aa4901a0814ed32d3304bfae5a149fe9038fdf6391fa59c8b6dd382011a6169"
    else
      url "https://github.com/tool3/dvd/releases/download/v1.0.14/dvd-linux-x64.tar.gz"
      sha256 "57b7c2d34f227caf8a613de9ca2082fc878af48947e618e09af6a81a324098ab"
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
