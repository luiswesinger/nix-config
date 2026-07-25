<div align="center">
  <img src="../../../.assets/NixOS.svg" alt="NixOS Logo" width="80" height="80">

  <h3 align="center">CLI Environment & Neovim Configurations</h3>

  <p align="center">
    High-performance terminal emulator settings, zsh shell configuration, modern CLI utilities, and dual Neovim environments.
  </p>
</div>

## Overview

The `cli` directory configures the command-line workspace. It integrates modern terminal replacements (`kitty`, `eza`, `bat`, `ripgrep`, `btop`, `yazi`) with a shell experience (`zsh` + `starship` + `fastfetch`) and provides two Neovim environments (`nix4nvchad` and `nixvim`).

---

## Components Breakdown

### 1. Terminal Emulator (`console/kitty.nix`)
- **Font:** `ProtoNerd Font Mono` @ size 13
- **Visuals:** Background opacity `0.90` with blur `20`, powerline-style slanted tabs, base16 color matching
- **Multiplexer Keybindings:**
  - `ctrl+shift+t` / `ctrl+shift+w`: Open / close tabs
  - `ctrl+shift+d` / `ctrl+shift+-`: Horizontal / vertical pane splits
  - `ctrl+shift+h/j/k/l`: Move focus between split windows
  - `f2`: Open Neovim in current working directory

### 2. Shell & Prompt (`console/zsh.nix` & `console/starship.nix`)
- Custom aliases mapping standard commands to modern rust-based alternatives:
  - `ll` / `l` / `tr` → `eza`
  - `cat` → `bat`
  - `grep` → `ripgrep` (`rg`)
  - `top` → `btop`
  - `y` → `yazi`
  - `ff` → `fastfetch`
- **Fastfetch:** Includes custom Gengar ASCII logo art (`console/fastfetch_logo/gengar.txt`).

### 3. Neovim Setups

#### A. NvChad 2.5 ([`nvchad.nix`](file:///home/luis/nix-config/home/features/cli/nvchad.nix))
Integrated via `nix4nvchad`. Features:
- Custom plugins: `glow.nvim` (Terminal markdown preview), `markdown-preview.nvim` (Browser preview), `csvview.nvim` (Excel-like CSV editing)
- PDF Integration: `<leader>z` opens the current PDF in Zathura
- **Cheatsheet Integration:** Embedded Kitty terminal shortcuts displayed directly in NvChad's `<leader>ch` cheatsheet under the **Kitty** Reiter/Card.


#### B. NixVim Suite ([`nixvim/`](file:///home/luis/nix-config/home/features/cli/nixvim))
> **!Currently not in Use and deprecated!**
Pure Nix-configured Neovim environment using `nixvim`. Includes Telescope fuzzy finder, Neo-tree file browser, Treesitter syntax highlighting, Lualine status bar, and Markview.

---

## Directory Structure

```
home/features/cli/
├── btop.nix          # System resource monitor configuration
├── cli_tools.nix     # Core CLI packages (eza, bat, ripgrep, etc.)
├── default.nix       # Main CLI module loader
├── git.nix           # Git version control options & aliases
├── nvchad.nix        # NvChad configuration with custom Lua plugins & Kitty cheatsheet
├── yazi.nix          # Blazing-fast terminal file manager
├── console/          # Terminal emulator and shell configs
│   ├── default.nix
│   ├── fastfetch.nix
│   ├── fastfetch_logo/
│   │   └── gengar.txt
│   ├── kitty.nix
│   ├── starship.nix
│   └── zsh.nix
└── nixvim/           # NixVim modular Neovim setup
    ├── colorscheme.nix
    ├── default.nix
    ├── keymaps.nix
    ├── options.nix
    ├── README.md
    └── plugins/
```
