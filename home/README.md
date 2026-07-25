<div align="center">
  <img src="../.assets/NixOS.svg" alt="NixOS Logo" width="80" height="80">

  <h3 align="center">Home-Manager User Environments</h3>

  <p align="center">
    Declarative user space configurations, applications, dotfiles, and profile management.
  </p>
</div>

## Overview

This directory houses all user-level configurations powered by [Home-Manager](https://github.com/nix-community/home-manager). It adopts a modular architecture separating core shared settings (`common.nix`), context-specific profiles (`profiles/`), and modular feature blocks (`features/`).

---

## Theme & Design System

The user environment utilizes **`nix-colors`** to maintain visual consistency across all terminal and GUI applications:
- **Active Color Scheme:** `Catppuccin Mocha`
- **Default Apps:**
  - **Terminal:** `kitty`
  - **Editor:** `nvim`
  - **Browser:** `brave`

---

## Profile Management (`home/profiles/`)

Profiles combine baseline user settings with workload-specific applications and modules:

| Profile | Purpose | Included Features | Target Machine |
| :--- | :--- | :--- | :--- |
| **`uni.nix`** | University & Work profile | [`common.nix`](file:///home/luis/nix-config/home/common.nix), VSCodium, OpenFortiVPN, Zoom | Laptop |
| **`leisure.nix`** | Gaming & Personal profile | [`common.nix`](file:///home/luis/nix-config/home/common.nix), Steam & Gaming tooling | Desktop |

---

## Folder Structure

```
home/
├── common.nix         # Base Home-Manager settings shared across all profiles
├── features/          # Modular feature definitions (CLI, AI, Apps, Programming, etc.)
└── profiles/
    ├── leisure.nix    # Gaming and leisure user environment profile
    └── uni.nix        # University and work environment profile
```

---

## Global Applications (`common.nix`)

Every user profile automatically inherits a curated suite of daily productivity tools:
- **Media & Communication:** `spotify`, `signal-desktop`, `obs-studio`, `gimp`
- **Browsers:** `brave`, `chromium`
- **Knowledge & Networking:** `logseq`, `openvpn`
