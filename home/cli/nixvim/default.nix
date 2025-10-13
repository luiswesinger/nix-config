{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./options.nix
    ./keymaps.nix
    ./colorscheme.nix
    ./plugins/init.nix
  ];

  programs.nixvim = {
    enable = true;
  };
}

