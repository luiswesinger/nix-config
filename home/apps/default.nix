# /home/apps/default.nix
{ pkgs, ... }:

{
  imports = [
    # ./geckodriver.nix
    ./zathura.nix
  ];

  
  home.packages = with pkgs; [
    # chatgpt 
    code-cursor
  ];
}
