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
      ./cli/nixvim.nix

      # console stuff
      ./cli/console/zsh.nix
      ./cli/console/starship.nix
      ./cli/btop.nix

      ./programming/python.nix
      ./programming/vscode.nix

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

    brave
    chromium
    netflix
  ];
 
  programs.git = {
    enable = true;
    userName = "Luis";
    userEmail = "wesingerluis@gmail.com";
  };

  #programs.vscode = {
    #enable = true;
    #package = pkgs.vscode;
  #};

  home.stateVersion = "25.05";
}
