# home/common.nix
{ inputs, pkgs, ... }:

{
  imports = [

    # ---   styling --- #
    inputs.nix-colors.homeManagerModules.default
    ./features/appearance
    ./features/cli
    ./features/apps
    ./features/programming
    ./features/ai
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
      BROWSER = "brave";
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
    brave
  ];

  home.stateVersion = "25.05";
}
