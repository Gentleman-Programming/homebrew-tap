# Gentleman Programming Homebrew Tap

Official Homebrew tap for [Gentleman Programming](https://github.com/Gentleman-Programming) tools.

## Installation

```bash
brew tap gentleman-programming/tap
```

## Available Formulas

### ai-code-review

🤖 Provider-agnostic code review using AI. Use Claude, Gemini, Codex, Ollama, or any AI to enforce your coding standards.

```bash
brew install gentleman-programming/tap/ai-code-review
```

Or after tapping:

```bash
brew tap gentleman-programming/tap
brew install ai-code-review
```

#### Usage

```bash
# Initialize in your project
cd ~/your-project
ai-code-review init

# Create your AGENTS.md with coding standards
# Then install the git hook
ai-code-review install

# Done! Reviews run on every commit
```

For more info: [ai-code-review repository](https://github.com/Gentleman-Programming/ai-code-review)

## Updating

```bash
brew update
brew upgrade ai-code-review
```

## Uninstalling

```bash
brew uninstall ai-code-review
brew untap gentleman-programming/tap
```
