# home/common.nix
{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./git.nix
    ./cli/nvchad.nix
    #./cli/nixvim/default.nix
    ./cli/console/default.nix
    ./cli/btop.nix
    ./cli/cli_tools.nix
    ./appearance/gtk.nix
    ./apps/default.nix
    ./programming/default.nix
  ];

  # Select one of this Colorschemes:
  # https://github.com/tinted-theming/base16-schemes
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  home = {
    username = "luis";
    homeDirectory = "/home/luis";
  };

  programs.home-manager = {
    enable = true;
  };

  home.packages = with pkgs; [
    spotify
    logseq
    openvpn
    gimp
    obs-studio
    signal-desktop
    brave
    chromium
  ];

  home.stateVersion = "25.05";
}