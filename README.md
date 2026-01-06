# Dotfiles

My dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

- `fish` - Fish shell configuration
- `starship` - Starship prompt
- `ghostty` - Ghostty terminal
- `nvim` - Neovim configuration
- `wezterm` - WezTerm terminal
- `gh` - GitHub CLI configuration
- `gh-dash` - GitHub CLI dashboard
- `ccstatusline` - Claude Code status line configuration

## Installation

1. Clone this repo to your home directory:
   ```bash
   git clone <repo-url> ~/dotfiles
   ```

2. Install stow:
   ```bash
   brew install stow
   ```

3. Stow the packages you want:
   ```bash
   cd ~/dotfiles
   stow fish starship ghostty nvim wezterm gh gh-dash ccstatusline
   ```

   Or stow a single package:
   ```bash
   stow fish
   ```

## Removing a package

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
