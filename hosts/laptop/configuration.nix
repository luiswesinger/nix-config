# hosts/laptop/configuration.nix
{ config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    
    ../modules/system/base.nix
    ../modules/system/programming.nix
    ../modules/tmp_programs.nix
  ];

  networking.hostName = "laptop";

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

