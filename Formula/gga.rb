class Gga < Formula
  desc "Gentleman Guardian Angel - Provider-agnostic code review using AI (Claude, Gemini, Codex, OpenCode, Ollama)"
  homepage "https://github.com/Gentleman-Programming/gentleman-guardian-angel"
  url "https://github.com/Gentleman-Programming/gentleman-guardian-angel/archive/refs/tags/v2.10.1.tar.gz"
  sha256 "c1dbcee120b83238e1c7ecce4a60f88a66810796ad95a239debc09e8509d0fba"
  license "MIT"
  version "2.10.1"

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

    # Update only the top-level LIB_DIR assignment in the installed script.
    # Do not match the runtime resolver assignment inside the guarded if statement.
    inreplace bin/"gga",
      /^LIB_DIR=.*/,
      "LIB_DIR=\"#{libexec}/lib\""
  end

  test do
    assert_match "gga v#{version}", shell_output("#{bin}/gga version")
  end
end
