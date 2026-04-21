class Shellfie < Formula
  desc "Transform terminal output into beautiful SVGs"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.0/shellfie-darwin-arm64.tar.gz"
      sha256 "c41d0adda1bf94d82fe13c731d0ef2ce8fed75376413e51eb525bef720b7ffdd"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.0/shellfie-darwin-x64.tar.gz"
      sha256 "8435dd47d0d3de7857ca1bb52f1e20238e690fdfc899d954cb611792b0e84652"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.0/shellfie-linux-arm64.tar.gz"
      sha256 "c66abf618a15c2e83417330859faec4800f4af2cf00d0c84d78a683510f0e414"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.4.0/shellfie-linux-x64.tar.gz"
      sha256 "66e73b3fc703ac7b736b85ba3be3c75c675d1ebf642d9f3a8da8786efaf4e393"
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
