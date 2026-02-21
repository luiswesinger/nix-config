# /home/cli/nixvim/plugins/markdown-preview.nix
{ ... }:

{
  programs.nixvim.plugins.markdown-preview = {
    enable = true;

    settings = {
      auto_start = 0; # no start per default
      auto_close = 1;
      refresh_slow = 0; # faster actualisation
      command_for_global = 0;
      open_to_the_world = 0; # no remote access
      browser = "firefox"; 
    };
  }; 

  # necessary dependencies for markdown-preview
  programs.nixvim.extraPackages = with pkgs; [
    nodejs
    yarn
  ];
}
