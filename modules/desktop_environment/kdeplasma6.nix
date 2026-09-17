# hosts/modules/desktop_environments/kdeplasma6.nix
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
      sddm.enable = true;
    };

    desktopManager = {
      plasma6.enable = true;
    };
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
  ];

  environment.systemPackages = [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background=${../../.assets/wallpapers/nix.png}
    '')
  ];
}
