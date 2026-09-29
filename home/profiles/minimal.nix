# home/profiles/minimal.nix
{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../features/appearance
    ../features/cli
    
    ../features/apps/unixtools.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  home = {
    username = "luis";
    homeDirectory = "/home/luis";

    sessionVariables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      VISUAL = "nvim";
      BRWOSER = "brave";
    };
  };

  programs.home-manager = {
    enable = true;
  };

  home.packages = with pkgs; [
    brave
  ];

  home.stateVersion = "25.05";
}
