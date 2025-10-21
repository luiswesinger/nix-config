# hosts/desktop/configuration.nix
{ config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
   
    ../modules/desktop_environment/kdeplasma6.nix

    ../modules/system/base.nix
    ../modules/system/programming.nix
  ];

  networking.hostName = "uni";

  # Define the user luis and link his home-manager configuration
  users.users.luis = {
    isNormalUser = true;
    description = "luis";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  
  programs = {
    ssh.startAgent = true;
    zsh.enable = true;
  };
}

