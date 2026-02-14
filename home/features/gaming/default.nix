# /home/gaming/default.nix
{ pkgs, ... }:

{
  imports = [
    ./proton.nix
  ];

  home.packages = with pkgs; [
    mangohud
    lutris
    heroic
    bottles
  ];  

}

