# home/cli/btop.nix
{ config, lib, pkgs, ... }:

let
  # You can change this to "light", "dark", or "nix-dark"
  themeVariant = "nix-dark";
in {
  programs.btop = {
    enable = true;

    settings = {
      # UI + Colors
      theme_background = false;
      color_theme = themeVariant;
      graph_symbol = "braille"; # smoother graphs
      rounded_corners = true;

      # Display & Layout
      update_ms = 1500; # refresh every 1.5s
      proc_sorting = "cpu lazy"; # CPU-heavy processes on top
      shown_boxes = "cpu mem net proc"; # show main panels
      graph_symbol_cpu = "braille";
      graph_symbol_mem = "braille";
      graph_symbol_net = "braille";

      # Behavior
      auto_update = true;
      log_level = "warning";
      cpu_single_graph = false;
      show_uptime = true;
      show_coretemp = true;
      show_gpu = true;

      # Memory visualization
      mem_graphs = true;
      mem_color_cached = true;

      # Fancy toggles
      vim_keys = true;
      rounded_corners = true;
    };

    # Optional: define custom themes
    # This places themes in ~/.config/btop/themes/
    extraThemes = {
      nix-dark = ''
        # NixOS inspired dark theme
        theme[main_bg]="#1e1e2e"
        theme[main_fg]="#cdd6f4"
        theme[hi_fg]="#89b4fa"
        theme[selected_bg]="#313244"
        theme[selected_fg]="#f38ba8"
        theme[cpu_box]="#94e2d5"
        theme[mem_box]="#fab387"
        theme[net_box]="#89b4fa"
        theme[proc_box]="#f9e2af"
      '';
    };
  };

  # Place custom themes
  home.file.".config/btop/themes/nix-dark.theme".text =
    lib.mkIf (themeVariant == "nix-dark") (lib.concatStringsSep "\n" [
      "[Theme]"
      "main_bg = #1e1e2e"
      "main_fg = #cdd6f4"
      "hi_fg = #89b4fa"
      "selected_bg = #313244"
      "selected_fg = #f38ba8"
      "cpu_box = #94e2d5"
      "mem_box = #fab387"
      "net_box = #89b4fa"
      "proc_box = #f9e2af"
    ]);
}

