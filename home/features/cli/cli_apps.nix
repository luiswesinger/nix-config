# /home/features/cli/cli_apps.nix
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ncspot  # spotify
  ];
}
