class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.8/shellfie-darwin-arm64.tar.gz"
      sha256 "6ca6710e2ab342e9e62861a314de6030bcd56b40318b93d9d5e2278b03225769"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.8/shellfie-darwin-x64.tar.gz"
      sha256 "9cbb126e9d27f631fc3d7a753ce73d9789cae5006b1aa4a9c3d229cbfa0ed55d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.8/shellfie-linux-arm64.tar.gz"
      sha256 "cb48faa647b4a11fefc9b8c4b61f278841f4cffa85f4a22d62e81ff55425e008"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.8/shellfie-linux-x64.tar.gz"
      sha256 "5f8cb2c5c157fd7dfc2a3793ff499b79b9535314539bfe390bbd7c55f9abd5fe"
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
