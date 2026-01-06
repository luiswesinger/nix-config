# home/leisure.nix
{
  inputs, 
  lib,
  config,
  pkgs,
  ...
}: 
{
  imports = [
      inputs.nix-colors.homeManagerModules.default

      ./cli/nvchad.nix
      # ./cli/nixvim/default.nix

      # console
      ./cli/console/default.nix
      ./cli/btop.nix
      ./cli/cli_tools.nix

      ./appearance/gtk.nix

      ./gaming/default.nix

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
    #discord
    openvpn
    gimp
    obs-studio
    signal-desktop
    zoom

    brave
    chromium
  ];
 
  programs.git = {
    enable = true;
    userName = "luis";
    userEmail = "wesingerluis@gmail.com";
  };


  home.stateVersion = "25.05";
}
