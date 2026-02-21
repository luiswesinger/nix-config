# home/profiles/leisure.nix
{ pkgs, ... }:

{
  imports = [
    ../common.nix
    ../features/gaming/default.nix
    ../features/programming/editors/vscodium.nix
  ];
}
