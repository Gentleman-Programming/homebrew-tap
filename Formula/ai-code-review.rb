class AiCodeReview < Formula
  desc "Provider-agnostic code review using AI (Claude, Gemini, Codex, Ollama)"
  homepage "https://github.com/Gentleman-Programming/ai-code-review"
  url "https://github.com/Gentleman-Programming/ai-code-review/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "732262787eebba7a7493f58b82c8b58a08d83ab72a8f7c618ae074186a2e5824"
  license "MIT"
  version "1.0.1"

  def install
    # Install main script
    bin.install "bin/ai-code-review"

    # Install library files
    (libexec/"lib").install "lib/providers.sh"

    # Update LIB_DIR path in the installed script
    inreplace bin/"ai-code-review", 
      /LIB_DIR=.*/, 
      "LIB_DIR=\"#{libexec}/lib\""
  end

  test do
    assert_match "AI Code Review v#{version}", shell_output("#{bin}/ai-code-review version")
  end
end
