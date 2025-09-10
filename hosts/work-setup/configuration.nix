# hosts/work-setup/configuration.nix
{ config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/base.nix
  ];

  networking.hostName = "work-setup";
  nixpkgs.config.allowUnfree = true;

  # Define the user luis and link his home-manager configuration
  users.users.luis = {
    isNormalUser = true;
    description = "Luis";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
