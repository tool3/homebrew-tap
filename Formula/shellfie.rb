class Shellfie < Formula
  desc "Transform terminal output into beautiful SVGs"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.2.1/shellfie-darwin-arm64.tar.gz"
      sha256 "42913106d2cced71b8fcc8d3ff2d1264a193fb951f28d1912d28ef6b1eda845b"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.2.1/shellfie-darwin-x64.tar.gz"
      sha256 "17ee27fddbeab695a1690c1f71fde25711b77c35ce5eb59b0118341e8edfc9fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.2.1/shellfie-linux-arm64.tar.gz"
      sha256 "6b3addaac6ad0d1696289f9954d81ed5421549d77cf6a01311de04181b4b7738"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.2.1/shellfie-linux-x64.tar.gz"
      sha256 "53bb2275c110b1ee159f46d42e4ad5fa792492463f3540efeeddb887fbd21734"
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
