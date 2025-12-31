# Gentleman Programming Homebrew Tap

Official Homebrew tap for [Gentleman Programming](https://github.com/Gentleman-Programming) tools.

## Installation

```bash
brew tap gentleman-programming/tap
```

## Available Formulas

### gentleman.dots 🎩

TUI installer for the complete Gentleman.Dots terminal environment. Includes terminals, shells, window managers, Neovim config, and more.

```bash
brew install gentleman-programming/tap/gentleman-dots
```

Or after tapping:

```bash
brew tap gentleman-programming/tap
brew install gentleman-dots
```

#### Usage

```bash
# Launch the interactive installer
gentleman.dots

# Show version
gentleman.dots --version

# Show help
gentleman.dots --help
```

Features:
- Interactive TUI with keyboard navigation
- Support for macOS and Linux
- Terminal emulators: Ghostty, Alacritty, WezTerm, Kitty
- Shells: Fish, Zsh, Nushell (with Starship prompt)
- Window managers: Tmux, Zellij
- Neovim with LazyVim and Gentleman config
- Backup/restore existing configs
- Educational content about each tool

For more info: [Gentleman.Dots repository](https://github.com/Gentleman-Programming/Gentleman.Dots)

---

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

---

## Updating

```bash
brew update
brew upgrade gentleman-dots
brew upgrade gga
```

## Uninstalling

```bash
brew uninstall gentleman-dots
brew uninstall gga
brew untap gentleman-programming/tap
```
