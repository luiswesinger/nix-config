# hosts/minimal/configuration.nix
{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix 

    ../../modules/desktop_environment/kdeplasma6.nix

    ../../modules/system/base
    ../../modules/system/services

    ../../modules/system/overlays.nix
  ];

  modules.services = {
    docker.enable = false;
    tailscale.enable = false;
  };

  networking.hostName = "minimal-nixos";

  users.users.luis = {
    isNormalUser = true;
    description = "luis";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 4096;
    }
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs = {
    zsh.enable = true;
  };
}
