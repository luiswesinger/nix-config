# hosts/minimal-setup/configuration.nix
{ config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/base.nix
  ];

  networking.hostName = "uni";

  # Define the user luis and link his home-manager configuration
  users.users.luis = {
    isNormalUser = true;
    description = "luis";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}

