# hosts/desktop/configuration.nix
{ config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ./additional-hardware-config.nix
   
    ../../modules/desktop_environment/kdeplasma6.nix

    ../../modules/system/base/default.nix

    ../../modules/system/overlays.nix

    ../../modules/apps/steam.nix
    ../../modules/apps/flatpak.nix
  ];

  networking.hostName = "desktop-luis";

  # Define the user luis and link his home-manager configuration
  users.users.luis = {
    isNormalUser = true;
    description = "luis";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  
  programs = {
    zsh.enable = true;
  };
}

