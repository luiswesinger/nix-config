{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
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

