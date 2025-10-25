# modules/system/programming.nix
{ config, pkgs, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    python3
    gdb
    clang
    gcc
    gnumake
  ];
}
