{ pkgs, ... }:

{
  home.username = "luis";
  home.homeDirectory = "/home/luis";
  home.stateVersion = "24.05";

  programs.fish.enable = true;
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
    extraPackages = with pkgs; [ ripgrep fd gnumake gcc cmake clang ];
  };

  programs.kitty = {
    enable = true;
    settings = {
      font_family = "0xProto Nerd Font Regular";
      font_size = 12.0;

      include = "${pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "kitty";
        rev = "v0.1.0";
        hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
      }}/catppuccin-frappe.conf";
    };
  };

  home.file.".config/nvim" = {
    source = pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
      rev = "v2.5";
      hash = "sha256-3jK6jkafmfgtMCkQjzKh9Svy7mdWfER80HtHtThCbZQ=";
    };
    recursive = true;
  };

  home.packages = with pkgs; [
    spotify
    discord
    firefox
    git
    python312
    (nerdfonts.override { fonts = ["0xProto"]; })
  ];

  programs.pyenv.enable = true;
  programs.rust.enable = true;

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    iconTheme.name = "Flatery-Indigo-Dark";
    iconTheme.package = pkgs.flatery-indigo-dark-theme;
    theme.name = "Flatery-Indigo-Dark";
    theme.package = pkgs.flatery-indigo-dark-theme;
  };
}

