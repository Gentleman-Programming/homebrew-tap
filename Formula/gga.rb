class Gga < Formula
  desc "Gentleman Guardian Angel - Provider-agnostic code review using AI (Claude, Gemini, Codex, OpenCode, Ollama)"
  homepage "https://github.com/Gentleman-Programming/gentleman-guardian-angel"
  url "https://github.com/Gentleman-Programming/gentleman-guardian-angel/archive/refs/tags/v2.5.1.tar.gz"
  sha256 "4d59060feb1f78581ae731aee5ffe1cefa0cf5fa08f0989a3505f09e5d75161d"
  license "MIT"
  version "2.5.1"

  def install
    # Install main script
    bin.install "bin/gga"

    # Install library files
    (libexec/"lib").install "lib/providers.sh"
    (libexec/"lib").install "lib/cache.sh"

    # Update LIB_DIR path in the installed script
    inreplace bin/"gga", 
      /LIB_DIR=.*/, 
      "LIB_DIR=\"#{libexec}/lib\""
  end

  test do
    assert_match "gga v#{version}", shell_output("#{bin}/gga version")
  end
end
