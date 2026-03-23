# home/features/desktop_environment/hyprland/keybinds.nix
{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      # system control
      "$mod, Escape, exec, powermenu"
      "$mod SHIFT, L, exec, swaylock"
      "$mod SHIFT, M, exit," 

      # start apps
      "$mod, Return, exec, $terminal"
      "$mod, E, exec, $fileManager"
      "$mod, SPACE, exec, $menu"
      
      # manage windows 
      "$mod, Q, killactive,"
      "$mod, F, togglefloating,"
      "$mod, G, fullscreen," 
      "$mod, S, togglesplit,"             
      "$mod, P, pseudo," 

      # change focus (vim-style)
      "$mod, H, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, K, movefocus, u"
      "$mod, J, movefocus, d"

      # change focus (arrow keys)
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # move windows (vim-style)
      "$mod SHIFT, H, movewindow, l"
      "$mod SHIFT, L, movewindow, r"
      "$mod SHIFT, K, movewindow, u"
      "$mod SHIFT, J, movewindow, d"

      # resize windows (vim-style + CTRL)
      "$mod CTRL, H, resizeactive, -60 0"
      "$mod CTRL, L, resizeactive, 60 0"
      "$mod CTRL, K, resizeactive, 0 -60"
      "$mod CTRL, J, resizeactive, 0 60"

      # audio control (requires wpctl / wireplumber)
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
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
}
