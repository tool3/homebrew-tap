class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.9/shellfie-darwin-arm64.tar.gz"
      sha256 "c3fcca06444826f4f2e91acfc2b92a2fbfbb597cc75dc8153fd63ac8b85f6717"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.9/shellfie-darwin-x64.tar.gz"
      sha256 "72f9a1697eb2ae4009c943654d7062c76d0e735ab7230a1cef4be206d831aafd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.9/shellfie-linux-arm64.tar.gz"
      sha256 "cde110c2105758113f27746f31a5a45deae02ce171534ddb393145509e375d79"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.9/shellfie-linux-x64.tar.gz"
      sha256 "df9d33343da88589b254fc027c06c33aca41962582f72bac8a8811333e28aa72"
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
