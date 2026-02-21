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

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
  };
}

