# /home/cli/cli_tools.nix
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pomodoro
    ripgrep
    gemini-cli
    chatgpt-cli
  ];
}
