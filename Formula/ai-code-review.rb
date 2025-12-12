class AiCodeReview < Formula
  desc "Provider-agnostic code review using AI (Claude, Gemini, Codex, Ollama)"
  homepage "https://github.com/Gentleman-Programming/ai-code-review"
  url "https://github.com/Gentleman-Programming/ai-code-review/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "18173f3314eb41880889e71e7d70f28f53fda307ffac4d288aa405ebe1b717ba"
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
