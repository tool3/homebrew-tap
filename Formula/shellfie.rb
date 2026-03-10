class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.6/shellfie-darwin-arm64.tar.gz"
      sha256 "32d085b0c26d82e9e277530ff664a9c13ca3706726d26862abe8a8437b3ea544"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.6/shellfie-darwin-x64.tar.gz"
      sha256 "157a8ba9ee81a10c010baaf24d31f46aca82be7956c6586f793fb1f15383c319"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.6/shellfie-linux-arm64.tar.gz"
      sha256 "a46c14840b0b764e874b799f07cb470418d7a7bbc88055f3f6928f7e56036381"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.6/shellfie-linux-x64.tar.gz"
      sha256 "eff523e88eb9232999c166a95352e92d477d7f54e608110460cb3e2428c8a2f9"
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
