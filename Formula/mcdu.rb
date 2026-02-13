class Mcdu < Formula
  desc "Modern disk usage analyzer with TUI and developer cleanup tools"
  homepage "https://github.com/mikalv/mcdu"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-macos-aarch64.tar.gz"
      sha256 "2b057d53df8b51c581ef3d75c73a98017765920b9a7a4a6cb16a7b83e66c479d"
    else
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-macos-x86_64.tar.gz"
      sha256 "f931224f1545dd13a1f23131cc002235c50d6748a54388a6dbff7d9beda7e0d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-linux-aarch64-musl.tar.gz"
      sha256 "78124fdd7d0062beb86c36ae67f544d2cb8fe6ac988c1d02f1e635a789268338"
    else
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-linux-x86_64-musl.tar.gz"
      sha256 "703273dbf5e726a5ea701a8094d6e6a488691e3642ff6757fb72fc9beb71c3e1"
    end
  end

  def install
    bin.install "mcdu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcdu --version")
  end
end
