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

## Setup

### Prerequisites

**macOS:**
```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Arch Linux:**
```bash
# Ensure base-devel is installed
sudo pacman -S --needed base-devel git
```

### 1. Clone and Install Stow

**macOS:**
```bash
git clone https://github.com/ryan-e-premier/dotfiles.git ~/dotfiles
brew install stow
```

**Arch Linux:**
```bash
git clone https://github.com/ryan-e-premier/dotfiles.git ~/dotfiles
sudo pacman -S stow
```

### 2. Install Applications

**macOS:**
```bash
# Terminal emulators
brew install --cask ghostty
brew install --cask wezterm

# Shell and prompt
brew install fish
brew install starship

# Other tools
brew install tmux
brew install neovim
brew install gh
brew install gh-dash
```

**Arch Linux:**
```bash
# Terminal emulators (ghostty from AUR)
yay -S ghostty
sudo pacman -S wezterm

# Shell and prompt
sudo pacman -S fish starship

# Other tools
sudo pacman -S tmux neovim github-cli
yay -S gh-dash

# Clipboard support (Wayland)
sudo pacman -S wl-clipboard
```

**Both platforms - Install Oh My Fish:**
```bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
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

**macOS:**
```bash
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
```

**Linux:**
```bash
chsh -s /usr/bin/fish
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
- Clipboard integration (wl-copy on Linux/Wayland)

**Key bindings (prefix is `C-s`):**

| Key | Action |
|-----|--------|
| `C-s C-s` | Split horizontally |
| `C-s C-v` | Split vertically |
| `C-s h/j/k/l` | Navigate panes |
| `C-s H/J/K/L` | Resize panes |
| `C-s r` | Reload config |

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
