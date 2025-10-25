{ pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;
	
    font = {
          name = "Proto Nerd Font Mono";
          size = 11;
    };

    settings = {
      background_opacity = "1";
      dynamic_background_opacity = "yes";
      window_padding_width = 6;
      window_border_width = 1;
      window_margin_width = 3;
      window_rounding = 8; 
      background_blur = 8;

      # Colors from global nix-colors theme
      foreground = "#${config.colorScheme.palette.base05}";
      background = "#${config.colorScheme.palette.base00}";

      color0  = "#${config.colorScheme.palette.base00}";
      color1  = "#${config.colorScheme.palette.base08}";
      color2  = "#${config.colorScheme.palette.base0B}";
      color3  = "#${config.colorScheme.palette.base0A}";
      color4  = "#${config.colorScheme.palette.base0D}";
      color5  = "#${config.colorScheme.palette.base0E}";
      color6  = "#${config.colorScheme.palette.base0C}";
      color7  = "#${config.colorScheme.palette.base05}";
      color8  = "#${config.colorScheme.palette.base03}";
      color9  = "#${config.colorScheme.palette.base08}";
      color10 = "#${config.colorScheme.palette.base0B}";
      color11 = "#${config.colorScheme.palette.base0A}";
      color12 = "#${config.colorScheme.palette.base0D}";
      color13 = "#${config.colorScheme.palette.base0E}";
      color14 = "#${config.colorScheme.palette.base0C}";
      color15 = "#${config.colorScheme.palette.base07}";
      
      # Behavior
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      remember_window_size = "yes";
      hide_window_decorations = "no";
    };
  };
}
