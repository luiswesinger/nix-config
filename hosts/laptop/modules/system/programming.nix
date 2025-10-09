# modules/system/programming.nix
{ config, pkgs, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    python313
    python313Packages.pip
    gdb
    clang
    gcc
  ];
}
