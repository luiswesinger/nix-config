# home/features/cli/default.nix
{
  imports = [
    ./git.nix
    ./nvchad.nix
    ./btop.nix
    ./cli_tools.nix
    ./ai_tools.nix
    ./yazi.nix
    ./console/default.nix
  ];
}
