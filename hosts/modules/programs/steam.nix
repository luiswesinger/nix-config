# /hosts/modules/programs/steam.nix
{ config, pkgs, lib, ... }:

{
  programs.steam.enable = true;

  programs.gamescope = {
    enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-tools
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];
  
  users.users.luis.extraGroups = [ "input" ];
}
