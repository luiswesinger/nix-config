{ pkgs, ... }:

{
  home.packages = with pkgs; [
    geckodriver
  ];
}
