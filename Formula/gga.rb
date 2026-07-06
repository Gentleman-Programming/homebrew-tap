class Gga < Formula
  desc "Gentleman Guardian Angel - Provider-agnostic code review using AI (Claude, Gemini, Codex, OpenCode, Ollama)"
  homepage "https://github.com/Gentleman-Programming/gentleman-guardian-angel"
  url "https://github.com/Gentleman-Programming/gentleman-guardian-angel/archive/refs/tags/v2.9.0.tar.gz"
  sha256 "696f0232ffb25894c497b365319700530c54a22d010d09fdef1695100802e6fa"
  license "MIT"
  version "2.9.0"

  def install
    # Install main script
    bin.install "bin/gga"

    # Install library files
    (libexec/"lib").install "lib/providers.sh"
    (libexec/"lib").install "lib/cache.sh"
    (libexec/"lib").install "lib/pr_mode.sh"

    # Inject release version (default is "dev" for local/source builds)
    inreplace bin/"gga",
      /VERSION=.*\{GGA_VERSION:-dev\}.*/,
      "VERSION=\"#{version}\""

    # Update LIB_DIR path in the installed script
    inreplace bin/"gga",
      /LIB_DIR=.*/,
      "LIB_DIR=\"#{libexec}/lib\""
  end

  test do
    assert_match "gga v#{version}", shell_output("#{bin}/gga version")
  end
end
