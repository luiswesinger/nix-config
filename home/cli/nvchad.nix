# /home/cli/nvchad.nix
{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nix4nvchad.homeManagerModule
  ];
  
  programs.nvchad = {
    enable = true;
  };
}
