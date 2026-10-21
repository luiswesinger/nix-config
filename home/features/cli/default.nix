# home/features/cli/default.nix
{
  imports = [
    ./git.nix
    ./direnv.nix
    ./nvchad.nix
    ./btop.nix
    ./cli_tools.nix
    ./yazi.nix
    ./console/default.nix
  ];
}
