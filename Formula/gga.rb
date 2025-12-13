class Gga < Formula
  desc "Gentleman Guardian Angel - Provider-agnostic code review using AI (Claude, Gemini, Codex, Ollama)"
  homepage "https://github.com/Gentleman-Programming/gentleman-guardian-angel"
  url "https://github.com/Gentleman-Programming/gentleman-guardian-angel/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "73c9e3856f30209306c3840f4637edd3c3872919c078144bf22acdc2087204d7"
  license "MIT"
  version "2.1.0"

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
