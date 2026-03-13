# /home/apps/default.nix
{ pkgs, ... }:

{
  imports = [
    # ./geckodriver.nix
    ./zathura.nix
    ./unixtools.nix
  ];

  
  home.packages = with pkgs; [
    # chatgpt 
    code-cursor
    p7zip
    imv
  ];
}
