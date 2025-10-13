{ ... }:

{
  programs.nixvim.extraConfigLua = ''
    -- Leader Key
    vim.g.mapleader = " "

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Neo-tree
    map('n', '<leader>e', ':Neotree toggle<CR>', opts)

    -- Telescope
    map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
    map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
    map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
    map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
  '';
}

