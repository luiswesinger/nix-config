<div align="center">
  <img src=".assets/NixOS.svg" alt="Logo" width="80" height="80">

  <h3 align="center">NixOS config</h3>

  <p align="center">
   This repository contains my personal NixOS configuration, which defines my entire system in a fully declarative and reproducible way. 
  </p> 
</div>

## About NixOS

NixOS is a Linux distribution built on the Nix package manager, known for its declarative configuration model and atomic, reproducible system builds. For further Information visit the [NixOS Homepage](https://www.nixos.org)

<img src=".assets/Screenshots/NixOS_Desktop_screenshot.png" alt="desktop_screenshot">

## Installation & Deployment

Move your target machine's `hardware-configuration.nix` into the appropriate directory under `hosts/` and deploy the flake:

```bash
# Laptop deployment (profile: uni)
sudo nixos-rebuild switch --flake .#laptop

# Desktop deployment (profile: leisure)
sudo nixos-rebuild switch --flake .#desktop
```

---

## Documentation Structure

Detailed documentation is available across the repository's modules:

| Section | Description |
| :--- | :--- |
| **[`hosts/`](file:///home/luis/nix-config/hosts/README.md)** | Machine configurations (`desktop`, `laptop`), hardware specs, and service toggles. |
| **[`modules/`](file:///home/luis/nix-config/modules/README.md)** | System modules: baseline OS settings, background services (`docker`, `openssh`, `tailscale`), desktop environments, and apps. |
| **[`home/`](file:///home/luis/nix-config/home/README.md)** | User environments via Home-Manager, profile definitions (`uni.nix`, `leisure.nix`), and global applications. |
| **[`home/features/`](file:///home/luis/nix-config/home/features/README.md)** | Modular user feature suites (AI, CLI, Appearance, Apps, Gaming, Programming). |
| ├── **[`cli/`](file:///home/luis/nix-config/home/features/cli/README.md)** | Shell (`zsh` + `starship`), Kitty terminal, and Neovim environments ([`NvChad`](file:///home/luis/nix-config/home/features/cli/nvchad.nix) & [`NixVim`](file:///home/luis/nix-config/home/features/cli/nixvim/README.md)). |
| ├── **[`programming/`](file:///home/luis/nix-config/home/features/programming/README.md)** | Code editors (VS Code / VSCodium), language runtimes (Python, C++), and Docker tools. |
| └── **[`desktop_environment/hyprland/`](file:///home/luis/nix-config/home/features/desktop_environment/hyprland/README.md)** | Custom Hyprland Wayland compositor setup with Waybar, Rofi, and Swaylock. |
| **[`scripts/`](file:///home/luis/nix-config/scripts/README.md)** | Standalone automation scripts (Debian/Mint terminal installer, SSH initialization, Logseq sync). |

---

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.
