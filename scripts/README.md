<div align="center">
  <img src="../.assets/NixOS.svg" alt="NixOS Logo" width="80" height="80">

  <h3 align="center">Automation & Utility Scripts</h3>

  <p align="center">
    Standalone shell scripts for system setup, non-NixOS terminal porting, SSH initialization, and Logseq notebook synchronization.
  </p>
</div>

## Overview

This directory contains standalone automation scripts designed for system maintenance, non-NixOS environment setup, SSH authentication management, and notebook synchronization.

---

## Script Index

| Script | Executable Path | Description |
| :--- | :--- | :--- |
| **Mint Terminal Installer** | [`setup_mint_terminal.sh`](file:///home/luis/nix-config/scripts/setup_mint_terminal.sh) | Standalone Bash installer that ports this repo's Kitty + Zsh + Starship + Fastfetch (Gengar ASCII) + 0xProto Nerd Font setup to Linux Mint / Ubuntu / Debian systems. |
| **SSH Key Initializer** | [`ssh-init.sh`](file:///home/luis/nix-config/scripts/ssh-init.sh) | Interactive helper for generating and loading SSH authentication keys. |
| **Logseq Notebook Sync** | [`sync_logseq.sh`](file:///home/luis/nix-config/scripts/sync_logseq.sh) | Automated Git pull/commit/push script for keeping personal Logseq knowledge vaults synchronized across devices. |
| **Cache Clear Helper** | [`clear.md`](file:///home/luis/nix-config/scripts/clear.md) | Guide for clearing Nix store garbage, build caches, and system journal logs. |

---

## Usage Instructions

### Porting Terminal Environment to Linux Mint / Ubuntu

To setup the identical Kitty + Zsh + Fastfetch terminal setup on a non-NixOS machine:

```bash
chmod +x ./scripts/setup_mint_terminal.sh
./scripts/setup_mint_terminal.sh
```

### Synchronizing Logseq Vault

```bash
chmod +x ./scripts/sync_logseq.sh
./scripts/sync_logseq.sh
```
