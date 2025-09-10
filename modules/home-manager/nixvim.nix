{ config, pkgs, nixvim, ... }:

{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
  
    colorschemes.catppuccin.enable = true;

    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
    };
    
    extraConfigLua = ''
      vim.opt.number = true
    '';
  };
}

