# hosts/desktop/configuration.nix
{ config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ./additional-hardware-config.nix
   
    ../../modules/desktop_environment/kdeplasma6.nix
    ../../modules/desktop_environment/hyprland.nix

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
  
  # Enable a swap file for memory cushioning
  swapDevices = [
    {
      # The size of the swap file in MiB. 4096 MiB = 4 GiB
      device = "/swapfile";
      size = 4096;
    }
  ];
  
  programs = {
    zsh.enable = true;
  };
}

