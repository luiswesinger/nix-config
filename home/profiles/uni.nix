# home/profiles/uni.nix
{ pkgs, ... }:

{
  imports = [
    ../common.nix
  ];


  home.packages = with pkgs; [
    discord
    openfortivpn
    zoom-us
  ];
}
