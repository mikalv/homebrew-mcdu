class Mcdu < Formula
  desc "Modern disk usage analyzer with TUI and developer cleanup tools"
  homepage "https://github.com/mikalv/mcdu"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-macos-aarch64.tar.gz"
      sha256 "adee3170492cc1c671984f81e5d8a286b0d24c5e704bf2509efa1b5b42cf683b"
    else
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-macos-x86_64.tar.gz"
      sha256 "6fac459c4082d88db814b84d05d7a9ecd06f46749f104ecea6426af7930dddc4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-linux-aarch64-musl.tar.gz"
      sha256 "63bd973753185a24c425af60906c5fb68c6c6e0a7d67deab6d1cd627410a9977"
    else
      url "https://github.com/mikalv/mcdu/releases/download/v#{version}/mcdu-linux-x86_64-musl.tar.gz"
      sha256 "f3623d86a6fe13c02c15b2692d726be5e80360a890a0cac0e63047082d27421e"
    end
  end

  def install
    bin.install "mcdu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcdu --version")
  end
end
