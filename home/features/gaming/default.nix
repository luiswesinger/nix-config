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
    # bottles # has errors with python dependencies, so commented out for now
    prismlauncher
  ];  

}

