class Gga < Formula
  desc "Gentleman Guardian Angel - Provider-agnostic code review using AI (Claude, Gemini, Codex, OpenCode, Ollama)"
  homepage "https://github.com/Gentleman-Programming/gentleman-guardian-angel"
  url "https://github.com/Gentleman-Programming/gentleman-guardian-angel/archive/refs/tags/v2.8.1.tar.gz"
  sha256 "e1be109ba7e60cecbf47cb4142717aca7bb7b3b651ef0d3d42c0b9d923e71ae2"
  license "MIT"
  version "2.8.1"

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
