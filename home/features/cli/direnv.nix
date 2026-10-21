# home/features/cli/direnv.nix
{ ... }:

{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # automatically hooks into zsh
    nix-direnv.enable = true;    # fast, persistent caching for nix flakes & shells
  };
}

# ==============================================================================
# USAGE GUIDE:
# ==============================================================================
# direnv automatically loads and unloads environment variables and dev tools
# when you enter or leave a project directory in your terminal.
#
# 1. In any project root directory that has a 'flake.nix' (or 'shell.nix'):
#      echo "use flake" > .envrc
#
# 2. Allow direnv to execute for that directory (security check):
#      direnv allow
#
# 3. Done! Whenever you 'cd' into this folder, your packages (e.g. python, rust,
#    gcc, nodejs) are instantly available. When you 'cd ..' out of it, your
#    environment returns to normal.
#
# Useful commands:
# - 'direnv reload' : Force reload of the environment after changing flake.nix
# - 'direnv status' : Check current environment status and loaded variables
# - 'direnv revoke' : Revoke permissions for the current directory
# ==============================================================================
