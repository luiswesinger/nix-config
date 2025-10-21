# hosts/modules/desktop_environments/gnome.nix
{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb = {
	layout = "de";
	variant = "";
      };
    };

    displayManager = {
      gdm.enable = true;
    };

    desktopManager = {
      gnome.enable = true;
    };
  };

  # Ensure D-Bus and Gnome keyring integration
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.caffeine
    gnomeExtensions.paperwm
    gnomeExtensions.clipboard-history
    gnomeExtensions.random-wallpaper
  ];
}

