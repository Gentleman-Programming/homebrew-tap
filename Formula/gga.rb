class Gga < Formula
  desc "Gentleman Guardian Angel - Provider-agnostic code review using AI (Claude, Gemini, Codex, OpenCode, Ollama)"
  homepage "https://github.com/Gentleman-Programming/gentleman-guardian-angel"
  url "https://github.com/Gentleman-Programming/gentleman-guardian-angel/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "96d4e4837299cfd63ac532c6d950482ccfe0189a574f4f52b06f27e52b81581f"
  license "MIT"
  version "2.5.0"

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
