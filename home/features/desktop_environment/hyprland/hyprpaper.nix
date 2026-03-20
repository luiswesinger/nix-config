# home/features/desktop_environment/hyprland/hyprpaper.nix
{ config, pkgs, ... }:

let
  nixConfigRoot = builtins.path { path = ../../../../.; };
  wallpaperFile = "${nixConfigRoot}/.assets/wallpapers/nix.png";
in
{
  home.file.".config/wallpaper.png".source = wallpaperFile;

  services.hyprpaper = {
    enable = true;
    
    settings = {
      splash = false;
      
      preload = [ "${config.home.homeDirectory}/.config/wallpaper.png" ];
      
      wallpaper = [ ",${config.home.homeDirectory}/.config/wallpaper.png" ];
    };
  };
}
