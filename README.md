<div align="center">
  <img src=".assets/NixOS.svg" alt="Logo" width="80" height="80">

  <h3 align="center">NixOS config</h3>

  <p align="center">
   This repository contains my personal NixOS configuration, which defines my entire system in a fully declarative and reproducible way. 
  </p> 
</div>

## About NixOS

NixOS is a Linux distribution built on the Nix package manager, known for its declarative configuration model and atomic, reproducible system builds. For further Information visit the [NixOS Homepage](https://www.nixos.org)

## Installation

Move your `hardware-configuration.nix` file in `/hosts/laptop/` and deploy the flake with this command: 

```
sudo nixos-rebuild switch --flake .#laptop
```

Activate the home-setup with:

```
home-manager switch --flake .#luis@laptop
```


## Repo-Tree

```
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
│   ├── gaming
│   │   ├── default.nix
│   │   └── proton.nix
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
│       │   └── steam.nix
│       ├── desktop_environment
│       │   ├── budgie.nix
│       │   ├── gnome.nix
│       │   └── kdeplasma6.nix
│       ├── system
│       │   ├── base.nix
│       │   └── programming.nix
│       └── tmp_programs.nix
├── LICENSE
└── README.md
```

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.
