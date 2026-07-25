<div align="center">
  <img src="../.assets/NixOS.svg" alt="NixOS Logo" width="80" height="80">

  <h3 align="center">System Hosts Configuration</h3>

  <p align="center">
    Declarative NixOS machine definitions for physical hardware profiles.
  </p>
</div>

## Overview

This directory contains the system-level NixOS configurations for each physical host machine. Every host entrypoint defines machine-specific hardware configurations, bootloaders, system services, networking settings, and ties into a specific Home-Manager user profile defined in [`../home/profiles`](file:///home/luis/nix-config/home/profiles).

---

## Host Configurations

| Hostname | Type | Config Path | Home-Manager Profile | Desktop Environment | Features |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **`laptop`** | Laptop (`hp-laptop-luis`) | [`hosts/laptop`](file:///home/luis/nix-config/hosts/laptop) | [`uni.nix`](file:///home/luis/nix-config/home/profiles/uni.nix) | KDE Plasma 6 | Swapfile (4 GiB), Graphics 32-bit support, VPN & Uni tools |
| **`desktop`** | Desktop (`desktop-luis`) | [`hosts/desktop`](file:///home/luis/nix-config/hosts/desktop) | [`leisure.nix`](file:///home/luis/nix-config/home/profiles/leisure.nix) | KDE Plasma 6 | Steam, Flatpak, Additional Storage Drives |

---

## Directory Structure

```
hosts/
├── desktop/
│   ├── additional-hardware-config.nix  # Extra mountpoints and GPU/disk settings
│   ├── configuration.nix               # Main desktop NixOS configuration
│   └── hardware-configuration.nix      # Auto-generated hardware options
└── laptop/
    ├── configuration.nix               # Main laptop NixOS configuration
    └── hardware-configuration.nix      # Auto-generated hardware options
```

---

## Deployment & Rebuild Commands

To apply system configurations on a target machine, run the corresponding command from the repository root:

### Desktop
```bash
sudo nixos-rebuild switch --flake .#desktop
```

### Laptop
```bash
sudo nixos-rebuild switch --flake .#laptop
```

---

## Configuration Details

- **User Setup:** Defines user `luis` as a primary user with `zsh` as default shell and `wheel` / `networkmanager` group privileges.
- **Memory Cushioning:** Configures an automatic `/swapfile` (4 GiB) for smooth memory handling under heavy workloads.
- **Shared Base Modules:** Both hosts import system-wide baseline settings from [`../modules/system/base`](file:///home/luis/nix-config/modules/system/base) and custom package overlays from [`../modules/system/overlays.nix`](file:///home/luis/nix-config/modules/system/overlays.nix).
