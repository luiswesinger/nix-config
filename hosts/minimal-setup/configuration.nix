# hosts/second-test/configuration.nix
{ config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/base.nix
  ];

  networking.hostName = "minimal-setup";

  # Define the user luis and link his home-manager configuration
  users.users.luis = {
    isNormalUser = true;
    description = "Luis";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # home-manager.users.luis = import ../../users/luis/home.nix;
}

