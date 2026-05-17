# home/common.nix
{ inputs, pkgs, ... }:

{
  imports = [

    # ---   styling --- #
    inputs.nix-colors.homeManagerModules.default
    ./features/appearance/default.nix

    ./features/cli/default.nix
    ./features/apps/default.nix
    ./features/programming/default.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha; #gruvbox-dark-medium;

  home = {
    username = "luis";
    homeDirectory = "/home/luis";
    
    # default apps
    sessionVariables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "firefox";
   };
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
