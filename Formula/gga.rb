class Gga < Formula
  desc "Gentleman Guardian Angel - Provider-agnostic code review using AI (Claude, Gemini, Codex, OpenCode, Ollama)"
  homepage "https://github.com/Gentleman-Programming/gentleman-guardian-angel"
  url "https://github.com/Gentleman-Programming/gentleman-guardian-angel/archive/refs/tags/v2.6.1.tar.gz"
  sha256 "844afdc50724423b1223ac172f63dfa66806dd01e9e01da1a4b7a85172745ef5"
  license "MIT"
  version "2.6.1"

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
