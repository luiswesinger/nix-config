{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    options = {
      shiftwith = 2;
      tabstop = 2;
      expandtab = true;
    };
    
    colorschemes.gruvbox.enable = true;

    plugins = {
      lualine.enable = true;
      #treesitter.enable = true;
      neo-tree.enable = true;
      telescope.enable = true;

    };
    
    extraConfigLua = ''
      -- Grundoptionen
      vim.opt.number = true
      vim.opt.relativenumber = true

      -- Telescope Keymaps
      vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true })

      -- Neo-Tree Keymap
      vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
    '';

  };
}

