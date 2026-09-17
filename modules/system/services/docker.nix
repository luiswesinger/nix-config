# modules/system/services/docker.nix
{ pkgs, ... }:

{
  virtualisation.docker.enable = true;

  users.users.luis.extraGroups = [ "docker" ];
}
