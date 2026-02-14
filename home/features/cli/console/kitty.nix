{ pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;
	
    settings = {
      dynamic_background_opacity = "yes";
      window_padding_width = 6;
      window_border_width = 1;
      window_margin_width = 3;
      window_rounding = 8; 
      background_blur = 8;
      
      # Behavior
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      remember_window_size = "yes";
      hide_window_decorations = "no";
    };
  };
}
