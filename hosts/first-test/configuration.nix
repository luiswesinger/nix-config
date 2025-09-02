# hosts/first-test/configuration.nix
{ config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/base.nix
    ../../modules/security/agenix.nix
    # You will create a separate file for your secrets from the example below
    # and import it here.
    # ./secrets.nix
  ];

  networking.hostName = "first-test";

  # Define the user luis and link his home-manager configuration
  users.users.luis = {
    isNormalUser = true;
    description = "Luis";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.users.luis = import ../../users/luis/home.nix;
}
