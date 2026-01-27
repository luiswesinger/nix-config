# home/uni.nix
{ pkgs, ... }:

{
  imports = [
    ./common.nix

    ./programming/editors/vscode.nix
  ];


  home.packages = with pkgs; [
    discord
    openfortivpn
    zoom-us
    zathura
  ];
}
