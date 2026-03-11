class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.21/shellfie-darwin-arm64.tar.gz"
      sha256 "9a2a47fa0ab21938047f65663faa1c2607dcfcddccc084c02816448e6e49d832"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.21/shellfie-darwin-x64.tar.gz"
      sha256 "97092d7162cd0f4a6e48111943fe076127864f9aa2d6e886150f565040edf4b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.21/shellfie-linux-arm64.tar.gz"
      sha256 "2697f1e95e1071a0dcf96e77703bbd5207dbb9002aa268e8f9619e063e09028f"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.21/shellfie-linux-x64.tar.gz"
      sha256 "f2890f15019798d763e192120fe030a8f2877592baa8b16373653e1f5a10fe75"
    end
  end

  def install
    if Hardware::CPU.arm?
      if OS.mac?
        bin.install "shellfie-darwin-arm64" => "shellfie"
      else
        bin.install "shellfie-linux-arm64" => "shellfie"
      end
    else
      if OS.mac?
        bin.install "shellfie-darwin-x64" => "shellfie"
      else
        bin.install "shellfie-linux-x64" => "shellfie"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shellfie --version")
  end
end
