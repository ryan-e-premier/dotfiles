# Dotfiles

My dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

- `fish` - Fish shell configuration
- `starship` - Starship prompt
- `ghostty` - Ghostty terminal
- `nvim` - Neovim configuration
- `wezterm` - WezTerm terminal
- `tmux` - Tmux terminal multiplexer
- `gh` - GitHub CLI configuration
- `gh-dash` - GitHub CLI dashboard
- `ccstatusline` - Claude Code status line configuration

## Fresh macOS Setup

### Prerequisites

Install Homebrew if not already installed:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 1. Clone and Install Stow

```bash
git clone https://github.com/ryan-e-premier/dotfiles.git ~/dotfiles
brew install stow
```

### 2. Install Applications

```bash
# Terminal emulators
brew install --cask ghostty
brew install --cask wezterm

# Shell and prompt
brew install fish
brew install starship

# Install Oh My Fish (fish plugin manager)
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Other tools
brew install tmux
brew install neovim
brew install gh
brew install gh-dash
```

### 3. Stow Configurations

```bash
cd ~/dotfiles
stow fish starship ghostty nvim wezterm tmux gh gh-dash ccstatusline
```

Or stow individual packages:

```bash
stow fish
```

### 4. Shell Setup

#### Set Fish as Default Shell

```bash
# Add fish to allowed shells
echo $(which fish) | sudo tee -a /etc/shells

# Set fish as default
chsh -s $(which fish)
```

#### Configure Starship in Fish

Starship should auto-load if `starship init fish` is in your fish config. If not, add to `~/.config/fish/config.fish`:

```fish
starship init fish | source
```

### 5. Terminal Setup

#### Ghostty

Launch Ghostty - it will automatically use the config at `~/.config/ghostty/config`.

#### WezTerm

Launch WezTerm - it will automatically use the config at `~/.config/wezterm/wezterm.lua`.

#### Tmux

Tmux will use the config at `~/.config/tmux/tmux.conf`. The configuration includes:

- Catppuccin Macchiato color scheme
- Vi-style key bindings
- Mouse support
- Ghostty terminal integration

**Key bindings:**

| Key | Action |
|-----|--------|
| `prefix + \|` | Split horizontally |
| `prefix + -` | Split vertically |
| `prefix + h/j/k/l` | Navigate panes |
| `prefix + H/J/K/L` | Resize panes |
| `prefix + r` | Reload config |

**Optional: Install TPM (Tmux Plugin Manager)**

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

## Removing a Package

```bash
stow -D fish
```

## Claude Code Status Line

The `ccstatusline` package contains a custom status line configuration for Claude Code showing model, context length, git branch, and git changes.

After stowing the package, enable the status line in Claude Code:

```bash
claude config set preferredStatusLine ccstatusline
```

This sets Claude Code to use the configuration at `~/.config/ccstatusline/settings.json`.
