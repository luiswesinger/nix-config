# hosts/modules/desktop_environments/budgie.nix
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
      budgie.enable = true;
    };
  };
}
