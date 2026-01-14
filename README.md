<div align="center">
  <img src=".assets/NixOS.svg" alt="Logo" width="80" height="80">

  <h3 align="center">NixOS config</h3>

  <p align="center">
   This repository contains my personal NixOS configuration, which defines my entire system in a fully declarative and reproducible way. 
  </p> 
</div>

## About NixOS

NixOS is a Linux distribution built on the Nix package manager, known for its declarative configuration model and atomic, reproducible system builds. For further Information visit the [NixOS Homepage](https://www.nixos.org)

<img src=".assets/NixOS_Desktop_screenshot.png" alt="desktop_screenshot">

## Installation

Move your `hardware-configuration.nix` file in `/hosts/laptop/` and deploy the flake with this command: 

```
sudo nixos-rebuild switch --flake .#laptop
```


## Repo-Tree

```
.
├── flake.lock
├── flake.nix
├── home
│   ├── appearance
│   │   └── gtk.nix
│   ├── apps
│   │   ├── default.nix
│   │   ├── geckodriver.nix
│   │   └── zathura.nix
│   ├── cli
│   │   ├── btop.nix
│   │   ├── cli_tools.nix
│   │   ├── console
│   │   │   ├── default.nix
│   │   │   ├── fastfetch.nix
│   │   │   ├── fastfetch_logo
│   │   │   │   └── gengar.txt
│   │   │   ├── kitty.nix
│   │   │   ├── starship.nix
│   │   │   └── zsh.nix
│   │   ├── nixvim
│   │   │   ├── colorscheme.nix
│   │   │   ├── default.nix
│   │   │   ├── keymaps.nix
│   │   │   ├── options.nix
│   │   │   ├── plugins
│   │   │   │   ├── init.nix
│   │   │   │   ├── lualine.nix
│   │   │   │   ├── markdown-preview.nix
│   │   │   │   ├── markview.nix
│   │   │   │   ├── neo-tree.nix
│   │   │   │   ├── telescope.nix
│   │   │   │   └── treesitter.nix
│   │   │   └── README.md
│   │   └── nvchad.nix
│   ├── common.nix
│   ├── default.nix
│   ├── gaming
│   │   ├── default.nix
│   │   └── proton.nix
│   ├── git.nix
│   ├── leisure.nix
│   ├── programming
│   │   ├── default.nix
│   │   ├── editors
│   │   │   ├── R.nix
│   │   │   ├── vscode.nix
│   │   │   └── vscodium.nix
│   │   └── languages
│   │       ├── c++.nix
│   │       ├── example_python_flake.md
│   │       └── python.nix
│   └── uni.nix
├── hosts
│   ├── desktop
│   │   ├── additional-hardware-config.nix
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   ├── laptop
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   └── modules
│       ├── apps
│       │   ├── flatpak.nix
│       │   └── steam.nix
│       ├── desktop_environment
│       │   ├── budgie.nix
│       │   ├── gnome.nix
│       │   └── kdeplasma6.nix
│       └── system
│           ├── base
│           │   ├── base.nix
│           │   ├── default.nix
│           │   ├── nix_ld.nix
│           │   └── openssh.nix
│           ├── overlays.nix
│           └── programming.nix
├── LICENSE
├── README.md
└── scripts
    ├── ssh-init.sh
    └── sync_logseq.sh
```

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.
