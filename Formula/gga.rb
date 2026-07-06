class Gga < Formula
  desc "Gentleman Guardian Angel - Provider-agnostic code review using AI (Claude, Gemini, Codex, OpenCode, Ollama)"
  homepage "https://github.com/Gentleman-Programming/gentleman-guardian-angel"
  url "https://github.com/Gentleman-Programming/gentleman-guardian-angel/archive/refs/tags/v2.10.0.tar.gz"
  sha256 "4d34dd6f2ed4ef46f4b56b23421355e13bd06df47890bbfdf1c65a0a6052610a"
  license "MIT"
  version "2.10.0"

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
    # NOTE: ^ anchor is critical — LIB_DIR= appears in the
    # if ! LIB_DIR=$(resolve_lib_dir ...) conditional too,
    # and matching both would break bash syntax.
    inreplace bin/"gga",
      /^LIB_DIR=.*/,
      "LIB_DIR=\"#{libexec}/lib\""
  end

  test do
    assert_match "gga v#{version}", shell_output("#{bin}/gga version")
  end
end
