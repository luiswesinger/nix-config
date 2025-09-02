# modules/programs/neovim.nix
{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
    extraPackages = with pkgs; [
      # You'll need to install the dependencies for NVChad here
      ripgrep
      fd
      gnumake
      gcc
      cmake
      clang
    ];
  };

  # Clone NVChad into your home directory and manage it with a symlink.
  home.file.".config/nvim" = {
    source = "${pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
      rev = "v2.5"; # Use a specific commit or tag for stability
      hash = "sha256-LOrOfPWpJU/ADWDyVwPv9XNuYPq5KJtmAmSzplpccmE%3D";
      }}";
    recursive = true;
  };
}
