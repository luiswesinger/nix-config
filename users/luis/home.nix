# users/luis/home.nix
{ config, pkgs, ... }:

{
  home.username = "luis";
  home.homeDirectory = "/home/luis";
  home.stateVersion = "24.05"; # Home Manager state version

  # Set up shell and terminal
  programs.fish.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Import your program configurations
  imports = [
    ../../modules/programs/neovim.nix
    ../../modules/programs/kitty.nix
    ../../modules/programs/vscode.nix
  ];

  # User packages
  home.packages = with pkgs; [
    spotify
    discord
    firefox
    git
    python312
    
  ];

  # Development tools
  # You can use nix-shell or direnv for project-specific environments,
  # but these are good defaults.
  # Python
  programs.pyenv.enable = true;
  # C/C++
  environment.systemPackages = with pkgs; [
    gcc
    gdb
    clang
    cmake
  ];
  # Rust
  programs.rust.enable = true;
  # C
  programs.c.enable = true;

  # Font
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "0xProto"
      ];
    })
  ];

  # GTK Theme and Icons
  gtk = {
    enable = true;
    iconTheme = {
      name = "Flatery-Indigo-Dark";
      package = pkgs.flatery-indigo-dark-theme;
    };
    theme = {
      name = "Flatery-Indigo-Dark";
      package = pkgs.flatery-indigo-dark-theme;
    };
  };
}
