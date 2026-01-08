# home/uni.nix
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    openfortivpn
    zoom-us
    zathura
  ];
}
