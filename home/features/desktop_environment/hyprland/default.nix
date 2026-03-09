# home/features/desktop_environment/hyprland/default.nix
{ config, pkgs, ... }:

let 
  colors = config.colorScheme.palette;
in
{
  imports = [
    ./waybar.nix
    ./powermenu.nix
    ./rofi.nix
    ./hyprpaper.nix
    ./swaylock.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    
    systemd.enable = true;

    settings = {
      
      input = {
          kb_layout = "de";
          kb_options = "ctrl:nocaps";
      };

      monitor = ",preferred,auto,1";

      "$terminal" = "kitty";
      "$fileManager" = "kitty -e yazi";
      "$mod" = "SUPER"; 
      "$menu" = "rofi -show drun";

      exec-once = [
         "waybar" 
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(${colors.base0E}ff) rgba(${colors.base0D}ff) 45deg";
        "col.inactive_border" = "rgba(${colors.base03}ff)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(${colors.base00}ee)"; # 'ee' adds slight transparency to the shadow
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      bind = [
        "$mod, Escape, exec, powermenu"
        "$mod, L, exec, swaylock"

        # start apps
        "$mod, Return, exec, $terminal"
        "$mod, E, exec, $fileManager"
        "$mod, SPACE, exec, $menu"
        
        # manage windows 
        "$mod, Q, killactive,"
        "$mod SHIFT, M, exit," 
        "$mod, F, togglefloating,"
        "$mod, J, togglesplit," 

        # change focus (vim-style)
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      ] ++ (
        # bind 9 workspaces
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, ${toString ws}, workspace, ${toString ws}"
              "$mod SHIFT, ${toString ws}, movetoworkspace, ${toString ws}"
            ]
          ) 9)
      );

      # mouse interactions
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
