# home/features/cli/yazi.nix
{ inputs, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    settings = {
      manager = {
        show_hidden = true; 
        sort_dir_first = true;
      };
    };
  };
}
