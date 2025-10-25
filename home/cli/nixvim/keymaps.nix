# /home/cli/nixvim/keymaps.nix
{
  programs.nixvim.extraConfigLua = ''
    -- Leader Key
    vim.g.mapleader = " "

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- ==============================
    -- Neo-tree
    -- ==============================
    map('n', '<leader>e', ':Neotree toggle<CR>', opts)
    map('n', '<leader>t', ':Neotree focus<CR>', opts) -- Fokus auf Tree ohne Toggle

    -- ==============================
    -- Terminal
    -- ==============================
    -- Horizontales Terminal-Split
    map('n', '<leader>th', ':split | terminal<CR>', opts)
    -- Vertikales Terminal-Split
    map('n', '<leader>tv', ':vsplit | terminal<CR>', opts)
    -- Terminal-Fokus wechseln (Normal -> Terminal)
    map('n', '<leader>tt', ':wincmd w<CR>', opts) 
    -- Terminal zurück in Normalmodus (falls du noch in Terminal bist)
    map('t', '<Esc><Esc>', '<C-\\><C-n>', opts)

    -- ==============================
    -- Neovim Editor Fokus
    -- ==============================
    map('n', '<leader>n', ':wincmd w<CR>', opts) -- Wechsel Fokus zum nächsten Fenster
    map('n', '<leader>p', ':wincmd p<CR>', opts) -- Wechsel Fokus zum vorherigen Fenster

    -- ==============================
    -- Telescope
    -- ==============================
    map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
    map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
    map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
    map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)

    -- ==============================
    -- Markdown-Preview 
    -- ==============================
    map('n', '<leader>mp', ':MarkdownPreviewToggle<CR>', opts) 

    -- ==============================
    -- Markview
    -- ==============================
    map('n', '<leader>mv', ':Markview<CR>', opts) 
    
    -- ==============================
    -- PDF / Zathura
    -- ==============================
    map('n', '<leader>z', ':!zathura % &<CR>', opts)

    '';
}

