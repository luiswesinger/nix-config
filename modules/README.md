<div align="center">
  <img src="../.assets/NixOS.svg" alt="NixOS Logo" width="80" height="80">

  <h3 align="center">System-Level NixOS Modules</h3>

  <p align="center">
    Modular NixOS system configuration building blocks, desktop environment options, and overlays.
  </p>
</div>

## Overview

The `modules` directory contains reusable system-level NixOS modules imported by host machine configurations in [`../hosts`](file:///home/luis/nix-config/hosts). It manages baseline OS settings, modular system background services, desktop environment implementations, system-wide application frameworks, and package overlays.

---

## Modules Breakdown

### 1. System Base & Core (`system/base/`)
- [`base.nix`](file:///home/luis/nix-config/modules/system/base/base.nix): System locale (`en_US.UTF-8` with German `de_DE.UTF-8` regional formatting, time zone `Europe/Berlin`), pipewire audio server, networking & firewall rules, nix flake configuration, and core system utilities.
- [`nix_ld.nix`](file:///home/luis/nix-config/modules/system/base/nix_ld.nix): Enables `nix-ld` dynamic linker support for unpatched dynamically linked x86_64 binaries.

### 2. Background System Services (`system/services/`)
Declarative, toggleable background service modules controlled via the `modules.services` namespace:
- [`default.nix`](file:///home/luis/nix-config/modules/system/services/default.nix): Service loader importing all service modules.
- [`docker.nix`](file:///home/luis/nix-config/modules/system/services/docker.nix): `modules.services.docker.enable` – Enables the Docker daemon and automatically adds user `luis` to the `docker` group.
- [`openssh.nix`](file:///home/luis/nix-config/modules/system/services/openssh.nix): `modules.services.openssh.enable` (defaults to `true`) – Configures OpenSSH daemon with hardened defaults (`PermitRootLogin = "no"`, `PasswordAuthentication = true`, firewall opened).
- [`tailscale.nix`](file:///home/luis/nix-config/modules/system/services/tailscale.nix): `modules.services.tailscale.enable` – Enables the Tailscale mesh VPN daemon.

### 3. Desktop Environment Modules (`desktop_environment/`)
Provides selectable desktop environment options:
- [`kdeplasma6.nix`](file:///home/luis/nix-config/modules/desktop_environment/kdeplasma6.nix): KDE Plasma 6 desktop suite & SDDM display manager (Active on `laptop` and `desktop`).
- [`hyprland.nix`](file:///home/luis/nix-config/modules/desktop_environment/hyprland.nix): System-level Hyprland compositor enablement & pam authentication options for Swaylock.
- [`gnome.nix`](file:///home/luis/nix-config/modules/desktop_environment/gnome.nix) & [`budgie.nix`](file:///home/luis/nix-config/modules/desktop_environment/budgie.nix): Alternative DE options.

### 4. Application System Modules (`apps/`)
- [`steam.nix`](file:///home/luis/nix-config/modules/apps/steam.nix): Enables Steam, GameMode, dedicated firewall ports for local play, and 32-bit hardware support.
- [`flatpak.nix`](file:///home/luis/nix-config/modules/apps/flatpak.nix): System-wide Flatpak package management support.

### 5. Overlays & Custom Packages (`system/overlays.nix`)
- Configures Nixpkgs unfree allowance and custom package overlays.

---

## Directory Structure

```
modules/
├── apps/
│   ├── flatpak.nix       # Flatpak system module
│   └── steam.nix         # Steam & gaming optimizations module
├── desktop_environment/
│   ├── budgie.nix        # Budgie desktop module
│   ├── gnome.nix         # GNOME desktop module
│   ├── hyprland.nix      # Hyprland Wayland compositor module
│   └── kdeplasma6.nix    # KDE Plasma 6 desktop module
└── system/
    ├── overlays.nix      # Custom Nixpkgs overlays
    ├── base/
    │   ├── base.nix      # Baseline NixOS system options
    │   ├── default.nix   # Main base loader
    │   └── nix_ld.nix    # Dynamically linked binary support
    └── services/
        ├── default.nix   # Aggregator for service modules
        ├── docker.nix    # Docker daemon & user group configuration
        ├── openssh.nix   # Hardened OpenSSH daemon service
        └── tailscale.nix # Tailscale VPN service
```
