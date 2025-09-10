{ config, pkgs, nixvim, ... }:

{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
  
    colorschemes.catputccin.enable = true;

    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
    };
    
    extraConfigLua = ''
      vim.opt.number = true
    '';
  };
}

