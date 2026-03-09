# home/profiles/leisure.nix
{ pkgs, ... }:

{
  imports = [
    ../common.nix
    ../features/desktop_environment/hyprland/default.nix
    ../features/gaming/default.nix
    ../features/programming/editors/vscodium.nix
  ];
}
