# /home/features/appearance/noctalia.nix
{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    inputs.noctalia-shell.packages
  ];
}
