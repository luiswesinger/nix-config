# /home/features/ai/cli_tools.nix
{pkgs,...}:

{
  home.packages = with pkgs; [
    gemini-cli
    cursor-cli
    claude-code
    #mistral-vibe
    #chatgpt-cli
    antigravity-cli

    herdr   # tool for managing agents in cli
  ];
}
