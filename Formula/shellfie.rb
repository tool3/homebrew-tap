class Shellfie < Formula
  desc "Transform terminal output into beautiful SVG images"
  homepage "https://github.com/tool3/shellfie-cli"
  version "2.0.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.22/shellfie-darwin-arm64.tar.gz"
      sha256 "f669ae80af74abfbe2dbe0fa96b6c90e942829d1d06b5700dfe6532422f38073"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.22/shellfie-darwin-x64.tar.gz"
      sha256 "bb50e9fb9e7383034823db02efe34f7ff380f84e35486d596d9ba64041fb9c5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.22/shellfie-linux-arm64.tar.gz"
      sha256 "d1453972091bb03e3af34e142cc314ac7d685b06d2bdfb822df9d31a1f341658"
    else
      url "https://github.com/tool3/shellfie-cli/releases/download/v2.0.22/shellfie-linux-x64.tar.gz"
      sha256 "0450094d8a5fc22d72f646cfad107faab02e34254e1eefd80eb198644d393466"
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
