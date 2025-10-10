# home-manager/home.nix
{
  inputs, 
  lib,
  config,
  pkgs,
  ...
}: 
{
  imports = [
      # console stuff
      ./console/zsh.nix
      ./console/starship.nix

      ./python.nix

      ./programs/nixvim.nix
   ];

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
    bitwarden-desktop
    bat

    brave
    chromium
    netflix

    # KDE-Plasma related stuff
    kdePackages.kio-gdrive
    kdePackages.kaccounts-integration
    kdePackages.kaccounts-providers
  ];
 
  programs.git = {
    enable = true;
    userName = "Luis";
    userEmail = "wesingerluis@gmail.com";
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
  };

  programs.btop = {
    enable = true;
    settings = {
      theme_background = false; # make btop transparent
    };
  };

  home.stateVersion = "25.05";
}
