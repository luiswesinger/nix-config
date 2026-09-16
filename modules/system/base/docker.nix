{ pkgs, ... }:

{
  virtualisation.docker.enable = true;

  users.users.luis.extraGroups = [ "docker" ];
}
