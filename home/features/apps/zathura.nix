# /home/apps/zathura.nix
{ config, pkgs, ... }:

{
  programs.zathura = {
    enable = true;
  };

  home.packages = with pkgs; [
    zathura
    poppler
  ];
}

