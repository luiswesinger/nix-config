# /home/features/cli/console/kitty.nix
{ pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "ProtoNerd Font Mono";
      size = 13;
    };

    # ── Keybindings (unixporn staple: kitty as multiplexer) ──────────────
    keybindings = {
      # Tabs
      "ctrl+shift+t"     = "new_tab_with_cwd";
      "ctrl+shift+w"     = "close_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left"  = "previous_tab";
      "ctrl+shift+,"     = "set_tab_title";

      # Splits (kitty windows)
      "ctrl+shift+d"     = "launch --location=hsplit --cwd=current";
      "ctrl+shift+minus"     = "launch --location=vsplit --cwd=current";
      "ctrl+shift+h"     = "neighboring_window left";
      "ctrl+shift+l"     = "neighboring_window right";
      "ctrl+shift+k"     = "neighboring_window up";
      "ctrl+shift+j"     = "neighboring_window down";

      # Quick editor in current dir
      "f2"               = "launch --cwd=current $EDITOR .";
    };

    settings = {
      # ── Glass effect ────────────────────────────────────────────────────
      background_opacity         = "0.90";
      dynamic_background_opacity = "yes";
      background_blur            = 20;

      # ── Layout / spacing ────────────────────────────────────────────────
      enabled_layouts       = "splits";
      window_padding_width  = "12 16";   # vertical horizontal — generous breathing room
      window_border_width   = "1.5";
      window_margin_width   = 0;

      # ── Split pane borders ──────────────────────────────────────────────
      active_border_color       = "#${config.colorScheme.palette.base0D}";
      inactive_border_color     = "#${config.colorScheme.palette.base01}";
      bell_border_color         = "#${config.colorScheme.palette.base08}";
      draw_minimal_borders      = "no";

      # ── Tab bar (powerline) ─────────────────────────────────────────────
      tab_bar_edge              = "top";
      tab_bar_style             = "powerline";
      tab_powerline_style       = "slanted";
      tab_bar_min_tabs          = 1;
      tab_bar_margin_width      = 0;
      tab_title_template        = " {index}: {title} ";
      active_tab_foreground     = "#${config.colorScheme.palette.base00}";
      active_tab_background     = "#${config.colorScheme.palette.base0D}";
      active_tab_font_style     = "bold";
      inactive_tab_foreground   = "#${config.colorScheme.palette.base04}";
      inactive_tab_background   = "#${config.colorScheme.palette.base01}";
      inactive_tab_font_style   = "normal";
      tab_bar_background        = "#${config.colorScheme.palette.base00}";

      # ── Cursor ──────────────────────────────────────────────────────────
      cursor                = "#${config.colorScheme.palette.base0D}";
      cursor_text_color     = "#${config.colorScheme.palette.base00}";
      cursor_shape          = "beam";
      cursor_beam_thickness = "1.8";
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = "15";

      # ── Colors (base16) ─────────────────────────────────────────────────
      foreground = "#${config.colorScheme.palette.base05}";
      background = "#${config.colorScheme.palette.base00}";
      color0     = "#${config.colorScheme.palette.base00}";
      color1     = "#${config.colorScheme.palette.base08}";
      color2     = "#${config.colorScheme.palette.base0B}";
      color3     = "#${config.colorScheme.palette.base0A}";
      color4     = "#${config.colorScheme.palette.base0D}";
      color5     = "#${config.colorScheme.palette.base0E}";
      color6     = "#${config.colorScheme.palette.base0C}";
      color7     = "#${config.colorScheme.palette.base05}";
      color8     = "#${config.colorScheme.palette.base03}";
      color9     = "#${config.colorScheme.palette.base08}";
      color10    = "#${config.colorScheme.palette.base0B}";
      color11    = "#${config.colorScheme.palette.base0A}";
      color12    = "#${config.colorScheme.palette.base0D}";
      color13    = "#${config.colorScheme.palette.base0E}";
      color14    = "#${config.colorScheme.palette.base0C}";
      color15    = "#${config.colorScheme.palette.base07}";

      # ── Selection & URL ─────────────────────────────────────────────────
      selection_foreground = "#${config.colorScheme.palette.base00}";
      selection_background = "#${config.colorScheme.palette.base0D}";
      url_color            = "#${config.colorScheme.palette.base0C}";
      url_style            = "curly";
      open_url_with        = "default";

      # ── Text rendering ───────────────────────────────────────────────────
      text_composition_strategy  = "platform";
      disable_ligatures          = "never";
      box_drawing_scale          = "0.001, 1, 1.5, 2";

      # ── Scrollback ───────────────────────────────────────────────────────
      scrollback_lines           = 10000;
      scrollback_pager           = "less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER";

      # ── Behavior ─────────────────────────────────────────────────────────
      confirm_os_window_close    = 0;
      enable_audio_bell          = "no";
      visual_bell_duration       = "0";
      remember_window_size       = "yes";
      hide_window_decorations    = "no";
      shell_integration          = "enabled";
      allow_remote_control       = "yes";

      # ── Performance ───────────────────────────────────────────────────────
      repaint_delay              = 10;
      input_delay                = 3;
      sync_to_monitor            = "yes";
    };
  };
}
