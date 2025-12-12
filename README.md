# Gentleman Programming Homebrew Tap

Official Homebrew tap for [Gentleman Programming](https://github.com/Gentleman-Programming) tools.

## Installation

```bash
brew tap gentleman-programming/tap
```

## Available Formulas

### gga (Gentleman Guardian Angel) 😇

Provider-agnostic code review using AI. Use Claude, Gemini, Codex, Ollama, or any AI to enforce your coding standards.

```bash
brew install gentleman-programming/tap/gga
```

Or after tapping:

```bash
brew tap gentleman-programming/tap
brew install gga
```

#### Usage

```bash
# Initialize in your project
cd ~/your-project
gga init

# Create your AGENTS.md with coding standards
# Then install the git hook
gga install

# Run manually
gga run

# Done! Reviews run on every commit
```

For more info: [gentleman-guardian-angel repository](https://github.com/Gentleman-Programming/gentleman-guardian-angel)

## Updating

```bash
brew update
brew upgrade gga
```

## Uninstalling

```bash
brew uninstall gga
brew untap gentleman-programming/tap
```
