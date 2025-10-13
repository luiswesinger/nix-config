{ ... }:

{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    ensureInstalled = [ "lua" "python" "nix" "bash" ];
    highlight.enable = true;
    indent.enable = true;
  };
}

