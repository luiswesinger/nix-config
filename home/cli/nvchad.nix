# /home/cli/nvchad.nix
{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nix4nvchad.homeManagerModule
  ];
  
  programs.nvchad = {
    enable = true;
    # Add custom plugins directly here:
    extraPlugins = ''
      return {
        -- Terminal-based Markdown preview
        {
          "ellisonleao/glow.nvim",
          cmd = "Glow",
          config = function()
            require("glow").setup({
              style = "dark",
              width = 120,
            })
          end,
        },

        -- Browser-based Markdown preview
        {
          "iamcco/markdown-preview.nvim",
          build = "cd app && yarn install",
          ft = { "markdown" },
          config = function()
            vim.g.mkdp_auto_start = 0
            vim.g.mkdp_browser = "firefox" -- or "chromium"
          end,
        },

        -- CSV/TSV Viewer
        {
          "hat0uma/csvview.nvim",
          opts = {
            parser = { comments = { "#", "//" } },
            keymaps = {
              -- Text objects for selecting fields
              textobject_field_inner = { "if", mode = { "o", "x" } },
              textobject_field_outer = { "af", mode = { "o", "x" } },
              -- Excel-like navigation
              jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
              jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
              jump_next_row = { "<Enter>", mode = { "n", "v" } },
              jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
            },
          },
          cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
        },
      }
    '';

    extraConfig = ''
      -- Markdown previews
      vim.keymap.set("n", "<leader>mg", ":Glow<CR>", { desc = "Markdown Glow preview" })
      vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Markdown Browser preview" })

      -- CSV View
      vim.keymap.set("n", "<leader>cv", ":CsvViewToggle display_mode=border<CR>", { desc = "CSV Toggle CSV border view" })
      
      -- Open PDF in Zathura
      vim.keymap.set("n", "<leader>z", function()
        local file = vim.fn.expand("%:p")
        if file:match("%.pdf$") then
          vim.fn.jobstart({ "zathura", file }, { detach = true })
        else
          print("Not a PDF file.")
        end
      end, { desc = "PDF Open current PDF in Zathura" })
    '';

  };
  
  # dependencies
  home.packages = with pkgs; [
    glow
    yarn
    nodejs
  ];
}
