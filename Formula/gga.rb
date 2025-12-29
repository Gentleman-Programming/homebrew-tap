class Gga < Formula
  desc "Gentleman Guardian Angel - Provider-agnostic code review using AI (Claude, Gemini, Codex, Ollama)"
  homepage "https://github.com/Gentleman-Programming/gentleman-guardian-angel"
  url "https://github.com/Gentleman-Programming/gentleman-guardian-angel/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "c62dfd74332100831d1ac7d99fc8fe3c05131751d6eec4fc5037621ed017faf4"
  license "MIT"
  version "2.3.0"

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
