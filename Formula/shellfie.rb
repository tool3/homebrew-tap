class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.12/shellfie-darwin-arm64.tar.gz"
      sha256 "d1d61a43627eb3ab4edaf5a317ce10657868460f34b273fa37ec96547c5d5183"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.12/shellfie-darwin-x64.tar.gz"
      sha256 "3474f250720b9300995899ada17b104686719fb5f7280b42ab32b322b3679ac0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.12/shellfie-linux-arm64.tar.gz"
      sha256 "fdb5b1e6da1154c011672c6d4b17af52b4bd29657663321831cf7b3856127259"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.12/shellfie-linux-x64.tar.gz"
      sha256 "39679601321cdd436ef9d9ae76fec22b8b209cd7a851478117ca069763aab0ee"
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
