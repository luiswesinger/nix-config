# home-manager/leisure.nix
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
      ./cli/nixvim/default.nix

      # console stuff
      ./cli/console/zsh.nix
      ./cli/console/starship.nix
      ./cli/console/kitty.nix
      
      ./cli/btop.nix
      ./cli/cli_tools.nix

      ./appearance/gtk.nix
   ];
 
   # Select one of this Colorschemes:
   # https://github.com/tinted-theming/base16-schemes
   colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  nixpkgs = {
    overlays = [
      # import overlays here
    ];

    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };


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
    discord
    openvpn
    gimp
    obs-studio
    signal-desktop

    brave
    chromium
  ];
 
  programs.git = {
    enable = true;
    userName = "Luis";
    userEmail = "wesingerluis@gmail.com";
  };


  home.stateVersion = "25.05";
}
