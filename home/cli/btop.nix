# home/cli/btop.nix
{ config, lib, pkgs, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "tokyo-storm";
      theme_background = true;
      update_ms = 500;
    };
  };
}

