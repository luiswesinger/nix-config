# /home/apps/zathura.nix
{ config, pkgs, ... }:

{
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set selection-clipboard clipboard
      set recolor true
      set recolor-keephue true
      set smooth-scroll true
      set adjust-width best-fit
      set statusbar-h-padding 6
      set statusbar-v-padding 2
      set show-scrollbars false
      set synctex true
    '';
  };

  home.packages = with pkgs; [
    zathura
    poppler
  ];

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
  };
}

