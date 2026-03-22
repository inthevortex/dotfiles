# Dotfiles

⚠️ Disclaimer: These dotfiles are highly tailored for my personal workflow and contain hardcoded system paths. They are provided here primarily for my own use and for others' reference. If you wish to use this setup, please ensure you review the configurations and update the hardcoded paths to match your system.

A modern, highly modular, and cross-platform dotfiles ecosystem.

Built around the philosophy of State Management over Symlinks and Zero-Knowledge Secrets, this repository provides an instant, reproducible development environment across Arch Linux, Debian, and macOS.

## Architecture Philosophy

- State Managed (Chezmoi): Replaces traditional stow symlink spaghetti with deep-copied, templated file states. Prevents git-pollution from runtime logs and caches.

- Zero-Knowledge Secrets: API keys and cloud credentials are never committed. They are securely injected at runtime from a local KeePassXC vault using Go templating.

- Context Aware: Auto-detects the operating system (Linux vs. macOS) and device type (Laptop vs. Desktop) to conditionally deploy packages, window managers, and battery modules.

## The Stack

### Terminal & Multiplexer

- Tmux: Custom scripts for rapid environment switching:
  - project-jumper.sh: FZF-powered workspace builder that spins up detached sessions with `lazygit` and `nvim` automatically.

  - ssh-jumper.sh: Smart SSH menu with deep VSCode Remote integration.

- Zsh: Modularized environment (`.zshenv`, `.zprofile`, `.zshrc`) with strict secret injection via `.zsecrets`.

- CLI UX: delta for beautiful git diffs, Catppuccin Macchiato themes everywhere.

## Installation / Bootstrapping

To bootstrap a new machine, you only need chezmoi. The initial run will prompt you for machine-specific context (like OS distribution and Laptop status) before building the system.

### 1. Install Chezmoi

#### Arch or Arch based

`sudo pacman -S chezmoi`

`yay -S chezmoi`

#### MacOS

`brew install chezmoi`

### 2. Initialize and Apply

`chezmoi init --apply [https://github.com/yourusername/dotfiles.git](https://github.com/yourusername/dotfiles.git)`

## Unlocking Secrets

If setting up on a new machine, ensure your KeePassXC database is synced to the machine first. Chezmoi will prompt for your master password during the apply phase to dynamically generate your ~/.aws/credentials, ~/.zsecrets, etc files locally.

## Daily Workflow

This repository is managed entirely via the Chezmoi CLI to prevent accidental drift.

Edit config: `chezmoi edit ~/.zshrc`

Sync from upstream: `chezmoi update` (added to `~/.zshrc` function `sysupdate`)
