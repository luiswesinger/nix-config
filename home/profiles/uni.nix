# home/profiles/uni.nix
{ pkgs, ... }:

{
  imports = [
    ../common.nix

    ../features/programming/editors/vscodium.nix
  ];


  home.packages = with pkgs; [
    discord
    openfortivpn
    zoom-us
    zathura
  ];
}
