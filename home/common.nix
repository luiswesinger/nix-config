# home/common.nix
{ inputs, pkgs, ... }:

{
  imports = [

    # ---   styling --- #
    inputs.nix-colors.homeManagerModules.default
    #./features/appearance/stylix.nix
    ./features/appearance/gtk.nix

    ./features/cli/git.nix
    ./features/cli/nvchad.nix
    #./features/cli/nixvim/default.nix
    ./features/cli/console/default.nix
    ./features/cli/btop.nix
    ./features/cli/cli_tools.nix
    ./features/apps/default.nix
    ./features/programming/default.nix
  ];

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
