class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.1.1/shellfie-darwin-arm64.tar.gz"
      sha256 "ce17c079f61085a82a28a177a4e7f4202ea24af2788b6de03fc6d8b710eb2346"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.1.1/shellfie-darwin-x64.tar.gz"
      sha256 "59271cbb30457bb695becf9610293b4094fb25d93d2faef00a7e9bf01dda205e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.1.1/shellfie-linux-arm64.tar.gz"
      sha256 "6c44c3ccd14a6feb865f340b0cb61ad2b4f8874027869fbfdbde2669388946fa"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.1.1/shellfie-linux-x64.tar.gz"
      sha256 "733398a190cf6a13d658cd1403eab3c32ad836296e4fed7add0053df03c84c7c"
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
