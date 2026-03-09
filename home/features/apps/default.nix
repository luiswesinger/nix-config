# /home/apps/default.nix
{ pkgs, ... }:

{
  imports = [
    # ./geckodriver.nix
    ./mime.nix # default apps 
    ./zathura.nix
    ./unixtools.nix
  ];

  
  home.packages = with pkgs; [
    # chatgpt 
    code-cursor
    p7zip
  ];
}
