# home/default.nix
{ inputs, ... }:

{
  imports = [
    ./common.nix
    ./uni.nix
    ./leisure.nix
  ];
}
