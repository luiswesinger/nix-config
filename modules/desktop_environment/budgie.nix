# hosts/modules/desktop_environments/budgie.nix
{ pkgs, ... }:

{
  services = {
    # disbale gnome's keyring
    gnome.gcr-ssh-agent.enable = false;

    xserver = {
      enable = true;
      xkb = {
	layout = "de";
	variant = "";
      };
      displayManager = {
        lightdm.enable = true;
      };

      desktopManager = {
        budgie.enable = true;
      };
    };

    displayManager.defaultSession = "budgie-desktop";
  };
}
