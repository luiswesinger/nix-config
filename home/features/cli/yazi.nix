# home/features/cli/yazi.nix
{ inputs, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    settings = {
      show_hidden = true; 
      sort_dir_first = true;
    };
  };
}
