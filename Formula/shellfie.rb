class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.1.3/shellfie-darwin-arm64.tar.gz"
      sha256 "71b66ecf53d7245bf2f25af9ab4aa50474f44cfe49ef6eedfd82e8804ae580b5"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.1.3/shellfie-darwin-x64.tar.gz"
      sha256 "a9d8516a040291846216636af47a3b9d23ba387de4e466a4faa248f5adf99cd7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.1.3/shellfie-linux-arm64.tar.gz"
      sha256 "4f699c60c2b293e7e505b5b19c986225788db1d470f3d674e949270a7e5149f3"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.1.3/shellfie-linux-x64.tar.gz"
      sha256 "5337465afa4377018d322ee5c1cdb8fbfe2b65cb25d2f87534524262542a410c"
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
