{ ... }:

{
  programs.nixvim.plugins.neo-tree.enable = true;

  # has to be activated beacuse idk
  programs.nixvim.plugins.web-devicons.enable = true;

  programs.nixvim.extraConfigLua = ''
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        position = "left",
        width = 30,
      },
    })
  '';
}

