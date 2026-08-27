class Mcdu < Formula
  desc "Modern disk usage analyzer with TUI and developer cleanup tools"
  homepage "https://github.com/mikalv/mcdu"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-macos-aarch64.tar.gz"
      sha256 "acd6ce5231c56ed034892a8c7e083f5c9c69b9fb9fe2c2245c83d17649f2a11a"
    else
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-macos-x86_64.tar.gz"
      sha256 "91b8f9335a518f8fd78893aa34c427a1e25b00bb14c84d4be8d7e74ef741b0cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-linux-aarch64-musl.tar.gz"
      sha256 "09a3868e721f69759bb8f013e87944a1c50d24a131208deb169682b82941c0b2"
    else
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-linux-x86_64-musl.tar.gz"
      sha256 "f97d4b7ad32681252c4f8cb62321e69f287579686bce36c3bcfa5e543c0e3597"
    end
  end

  def install
    bin.install "mcdu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcdu --version")
  end
end
