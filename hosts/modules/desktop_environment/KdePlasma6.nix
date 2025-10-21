# hosts/modules/desktop_environments/KdePlasma6.nix
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
}
