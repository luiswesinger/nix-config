# /home/cli/ai_tools.nix
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gemini-cli
    #chatgpt-cli
    cursor-cli
    claude-code
    mistral-vibe
  ];
}
