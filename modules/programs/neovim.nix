# modules/programs/neovim.nix
{ pkgs, lib, home, ... }:

{
  # Home-Manager Neovim aktivieren
  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
    extraPackages = with pkgs; [
      ripgrep
      fd
      gnumake
      gcc
      cmake
      clang
    ];
  };

  # NVChad als Home-Manager "file" installieren
  home.file.".config/nvim" = {
    source = pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
      rev = "v2.5";  # Stabiler Tag oder Commit
      hash = "sha256-3jK6jkafmfgtMCkQjzKh9Svy7mdWfER80HtHtThCbZQ=";
    };
    recursive = true;
  };
}

