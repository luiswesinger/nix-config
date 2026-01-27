# home/leisure.nix
{ pkgs, ... }:

{
  imports = [
    ./common.nix
    ./gaming/default.nix
    ./programming/editors/vscodium.nix
  ];
}
