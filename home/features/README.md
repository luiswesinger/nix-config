<div align="center">
  <img src="../../.assets/NixOS.svg" alt="NixOS Logo" width="80" height="80">

  <h3 align="center">Modular Home-Manager Features</h3>

  <p align="center">
    Composable feature modules for terminal utilities, development tools, UI themes, and applications.
  </p>
</div>

## Overview

The `features` directory houses granular Nix configuration modules. Each subfolder encapsulates a specific domain of the user environment, allowing profiles in [`../profiles`](file:///home/luis/nix-config/home/profiles) to selectively import required functionality.

---

## Feature Modules Matrix

| Module | Description | Key Components |
| :--- | :--- | :--- |
| **[`ai/`](file:///home/luis/nix-config/home/features/ai)** | AI Development & CLI Assistants | `gemini-cli`, `claude-code`, `antigravity-cli`, `herdr` agent manager |
| **[`appearance/`](file:///home/luis/nix-config/home/features/appearance)** | System Aesthetics & GTK Theming | Dracula GTK Theme, Catppuccin Cursors, Flatery/Dracula Icons, 0xProto & Roboto Mono Fonts |
| **[`apps/`](file:///home/luis/nix-config/home/features/apps)** | Desktop Applications & Utilities | `zathura` (PDF viewer with custom keybinds), `geckodriver`, MIME associations, Unix utilities |
| **[`cli/`](file:///home/luis/nix-config/home/features/cli)** | Shells, Terminals & Neovim | `kitty`, `zsh`, `starship`, `fastfetch` (Gengar ASCII art), `btop`, `yazi`, `nixvim`, `nvchad` |
| **[`desktop_environment/`](file:///home/luis/nix-config/home/features/desktop_environment)** | Wayland Window Manager | Hyprland, Waybar status bar, Rofi application launcher, Swaylock, Hyprpaper |
| **[`gaming/`](file:///home/luis/nix-config/home/features/gaming)** | Gaming Environment | Proton, Steam compatibility tools, gaming helpers |
| **[`programming/`](file:///home/luis/nix-config/home/features/programming)** | Development Toolchains & IDEs | VS Code, VSCodium, RStudio, Python & C++ toolchains |

---

## Directory Structure

```
home/features/
├── ai/                      # AI command-line interfaces & applications
├── appearance/              # GTK styling, icon sets, cursor themes, font packaging
├── apps/                    # General desktop application configs & file associations
├── cli/                     # Command-line tools, shells, terminals & Neovim suites
├── desktop_environment/     # Hyprland Wayland desktop environment configs
├── gaming/                  # Proton/Steam gaming configuration
└── programming/             # IDEs, code editors, and compiler toolchains
```
