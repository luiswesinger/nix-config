# home/features/desktop_environment/hyprland/hyprpaper.nix
{ config, pkgs, ... }:

{
  home.file.".config/wallpaper.jpg".source = ../../../../.assets/wallpapers/nix.png;

  services.hyprpaper = {
    enable = true;
    
    settings = {
      splash = false;
      
      preload = [ "~/.config/wallpaper.jpg" ];
      
      wallpaper = [ ",~/.config/wallpaper.jpg" ];
    };
  };
}
