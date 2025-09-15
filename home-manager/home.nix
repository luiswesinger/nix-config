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
      # ./console.nix
      ./nixvim.nix
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

  programs.home-manager.enable = true; 
  home.packages = with pkgs; [
    spotify
    logseq
    discord
    openvpn
    gimp
    obs-studio

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
