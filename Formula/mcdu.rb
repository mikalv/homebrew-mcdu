class Mcdu < Formula
  desc "Modern disk usage analyzer with TUI and developer cleanup tools"
  homepage "https://github.com/mikalv/mcdu"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-macos-aarch64.tar.gz"
      sha256 "67b51ef435d94f2a9430d8aa5feadc21329604b2680829ce4a153f97ac2ce94e"
    else
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-macos-x86_64.tar.gz"
      sha256 "60a8bf0f6ba77fcc9764cfe4aee8291bc2562bb7040c4d80a7a4d325279fbdf8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-linux-aarch64-musl.tar.gz"
      sha256 "9cb25918df98b0aa209c7e1ea76e8407c33d9cee521a654a164a1603b4b654f3"
    else
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-linux-x86_64-musl.tar.gz"
      sha256 "e1a3d1b0569aa80bbb4e920f1e4cd66cb4eb20bc7124b749efdf93cddfd7975c"
    end
  end

  def install
    bin.install "mcdu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcdu --version")
  end
end
