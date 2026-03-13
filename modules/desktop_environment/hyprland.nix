# modules/desktop_environments/hyprland.nix
{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true; 
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true; 
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Polkit-Agent for root-permissions in gui-apps
  security.polkit.enable = true;

  # default apps for hyprland
  environment.systemPackages = with pkgs; [
    polkit_gnome
    wl-clipboard
  ];
  
  # start-script for polkit-agent
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

}
