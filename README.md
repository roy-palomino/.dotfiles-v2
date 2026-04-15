# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- [Oh My Zsh](https://ohmyz.sh/) with [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [Omarchy](https://omarchy.com/) (for Hyprland/Wayland configs)

## Quick Setup

```bash
git clone <repo-url> ~/.dotfiles-v2
cd ~/.dotfiles-v2
```

### Stow all packages at once

```bash
stow ghostty git hypr nvim starship tmux walker waybar zsh bin personal
```

### Or pick what you need

```bash
# Shell
stow zsh

# Editor
stow nvim

# Terminal
stow ghostty

# Prompt
stow starship

# Git config
stow git

# Tmux (includes ~/.tmux.conf and ~/.config/tmux/tmux.conf)
stow tmux

# Scripts (~/.local/bin: tmux-sessionizer, cht.sh, etc.)
stow bin

# Personal aliases
stow personal

# Omarchy / Hyprland desktop
stow hypr waybar walker
```

## Packages

| Package | Description |
|---|---|
| `bin` | Custom scripts (`tmux-sessionizer`, `cht.sh`, `claude-idle-inhibitor`, `gammastep-control`) |
| `ghostty` | Ghostty terminal config |
| `git` | Git aliases, pull rebase, histogram diffs, global ignore |
| `hypr` | Hyprland: keybindings, monitors, workspaces, input, autostart, lock, idle, sunset |
| `nvim` | Neovim config |
| `personal` | Personal shell aliases |
| `starship` | Starship prompt theme |
| `tmux` | Tmux config (prefix, vi mode, pane controls) |
| `walker` | Walker launcher config |
| `waybar` | Waybar panel config + style |
| `zsh` | Zsh config (oh-my-zsh, pnpm, nvm, tmux-sessionizer) |

## Removing a package

```bash
stow -D <package>
```

## Notes

- `bak/` contains reference backups (not a stow package).
- `i3/` and `i3status/` are legacy configs from a previous setup.
- If a target file already exists, use `stow --adopt <package>` to pull it into the repo, then review with `git diff`.
