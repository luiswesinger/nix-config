<div align="center">
  <img src="../../../../.assets/NixOS.svg" alt="NixOS Logo" width="80" height="80">

  <h3 align="center">Hyprland Wayland Desktop Environment</h3>

  <p align="center">
    Dynamic tiling Wayland compositor setup featuring custom status bar, launcher, lockscreen, and wallpaper management.
  </p>
</div>

## Overview

This directory provides a fully custom **Hyprland** desktop environment setup. It pairs Hyprland with Waybar for system status panels, Rofi for application launcher and power menu, Swaylock for session locking, and Hyprpaper for wallpaper management.

---

## Modules Breakdown

| File | Module Purpose | Description |
| :--- | :--- | :--- |
| [`default.nix`](file:///home/luis/nix-config/home/features/desktop_environment/hyprland/default.nix) | Main Loader | Imports all Hyprland components and packages |
| [`keybinds.nix`](file:///home/luis/nix-config/home/features/desktop_environment/hyprland/keybinds.nix) | Keybindings | Vim-style window focus, resizing, movement & workspace controls |
| [`waybar.nix`](file:///home/luis/nix-config/home/features/desktop_environment/hyprland/waybar.nix) | Status Panel | Powerline top bar displaying workspaces, CPU, memory, clock, and battery |
| [`rofi.nix`](file:///home/luis/nix-config/home/features/desktop_environment/hyprland/rofi.nix) | App Launcher | Application finder and launcher styled with Catppuccin palette |
| [`powermenu.nix`](file:///home/luis/nix-config/home/features/desktop_environment/hyprland/powermenu.nix) | Power Menu | System shutdown, reboot, lock, and logout script launcher |
| [`swaylock.nix`](file:///home/luis/nix-config/home/features/desktop_environment/hyprland/swaylock.nix) | Screen Locker | Custom blurred screen locker with Catppuccin theme styling |
| [`hyprpaper.nix`](file:///home/luis/nix-config/home/features/desktop_environment/hyprland/hyprpaper.nix) | Wallpapers | Wallpapers configuration and rendering engine |

---

## Essential Keybindings (`SUPER` / `Windows` key)

### Window Management & Focus
- `SUPER + Return`: Launch Kitty Terminal
- `SUPER + Space`: Launch Rofi App Menu
- `SUPER + E`: Launch File Manager (Yazi/Dolphin)
- `SUPER + Q`: Close active window
- `SUPER + F`: Toggle floating mode
- `SUPER + G`: Toggle fullscreen mode
- `SUPER + H / J / K / L`: Focus left / down / up / right window (Vim navigation)
- `SUPER + SHIFT + H / J / K / L`: Move window left / down / up / right
- `SUPER + CTRL + H / J / K / L`: Resize active window

### System Actions
- `SUPER + Escape`: Launch Power Menu
- `SUPER + SHIFT + L`: Lock screen (`swaylock`)
- `SUPER + SHIFT + M`: Exit Hyprland session
- `SUPER + 1..9`: Switch to workspace 1..9
- `SUPER + SHIFT + 1..9`: Move active window to workspace 1..9
