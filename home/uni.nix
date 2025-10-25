# home/uni.nix
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

      # nixvim
      ./cli/nixvim/default.nix

      # console
      ./cli/console/default.nix

      # additional cli modules
      ./cli/btop.nix
      ./cli/cli_tools.nix

      # programming modules
      ./programming/default.nix

      ./appearance/gtk.nix

      ./apps/default.nix
   ];
 
   # Select one of this Colorschemes:
   # https://github.com/tinted-theming/base16-schemes
   colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  nixpkgs = {
    overlays = [
      # import overlays here
    ];

    # Configure nixpkgs instance
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
    openfortivpn
    gimp
    obs-studio
    signal-desktop
    zoom-us
    zathura
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
