{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pomodoro
  ];
}
