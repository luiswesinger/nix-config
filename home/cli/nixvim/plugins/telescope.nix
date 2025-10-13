{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        layout_strategy = "vertical";
        sorting_strategy = "ascending";
      };
    };
  };
}

