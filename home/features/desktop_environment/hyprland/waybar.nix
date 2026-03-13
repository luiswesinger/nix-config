# home/features/desktop_environment/hyprland/waybar.nix
{ config, pkgs, ... }:

let
  colors = config.colorScheme.palette;
  custom = {
    font = "Proto Nerd Font";
    font_size = "15px";
    font_weight = "bold";
    text_color = "#${colors.base05}";
    background_0 = "#${colors.base00}";
    background_1 = "#${colors.base01}";
    border_color = "#${colors.base03}";
    red = "#${colors.base08}";
    green = "#${colors.base0B}";
    yellow = "#${colors.base0A}";
    blue = "#${colors.base0D}";
    magenta = "#${colors.base0E}";
    cyan = "#${colors.base0C}";
    orange = "#${colors.base09}";
    orange_bright = "#${colors.base09}";
    opacity = "1";
  };
in
{
  programs.waybar = {
    enable = true;
    
    settings.mainBar = {
      position = "bottom";
      layer = "top";
      height = 32;
      modules-left = [ "custom/launcher" "hyprland/workspaces" "tray" ];
      modules-center = [ "clock" ];
      modules-right = [
        "cpu"
        "memory"
        "pulseaudio"
        "network"
        "battery"
        "hyprland/language"
        "custom/power-menu"
      ];

      clock = {
        format = "  {:%H:%M}";
        tooltip = true;
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "  {:%d/%m}";
      };

      "hyprland/workspaces" = {
        active-only = false;
        disable-scroll = true;
        format = "{icon}";
        on-click = "activate";
        format-icons = {
          "1" = "I"; "2" = "II"; "3" = "III"; "4" = "IV"; "5" = "V";
          "6" = "VI"; "7" = "VII"; "8" = "VIII"; "9" = "IX"; "10" = "X";
        };
        persistent-workspaces = {
          "1" = [ ]; "2" = [ ]; "3" = [ ]; "4" = [ ]; "5" = [ ];
        };
      };

      cpu = {
        format = "<span foreground='${custom.green}'> </span> {usage}%";
        interval = 2;
      };

      memory = {
        format = "<span foreground='${custom.cyan}'>󰟜 </span>{}%";
        interval = 2;
      };

      network = {
        format-wifi = "<span foreground='${custom.magenta}'> </span> {signalStrength}%";
        format-ethernet = "<span foreground='${custom.magenta}'>󰀂 </span>";
        format-disconnected = "<span foreground='${custom.magenta}'>󰖪 </span>";
      };

      tray = { icon-size = 18; spacing = 8; };

      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = "<span foreground='${custom.blue}'> </span> {volume}%";
        format-icons = { default = [ "<span foreground='${custom.blue}'> </span>" ]; };
        on-click = "pavucontrol";
      };

      battery = {
        format = "<span foreground='${custom.yellow}'>{icon}</span> {capacity}%";
        format-icons = [ " " " " " " " " " " ];
        format-charging = "<span foreground='${custom.yellow}'> </span>{capacity}%";
        states = { warning = 20; critical = 10; };
      };

      "hyprland/language" = {
        format = "<span foreground='${custom.yellow}'> </span> {}";
      };

      "custom/launcher" = {
        format = "";
        on-click = "rofi -show drun";
        tooltip = false;
      };

      "custom/power-menu" = {
        tooltip = true;
        tooltip-format = "Power menu";
        format = "<span foreground='${custom.red}'> </span>";
        on-click = "powermenu";
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0px;
        font-family: ${custom.font};
        font-weight: ${custom.font_weight};
        font-size: ${custom.font_size};
      }

      window#waybar {
        background: ${custom.background_1};
        border-top: 1px solid ${custom.border_color};
      }

      #workspaces { padding-left: 15px; }
      #workspaces button {
        color: ${custom.yellow};
        padding: 0 5px;
        margin-right: 10px;
      }
      #workspaces button.empty { color: ${custom.text_color}; }
      #workspaces button.active { color: ${custom.orange_bright}; }

      #clock { color: ${custom.text_color}; }
      #tray { margin-left: 10px; }

      #pulseaudio, #network, #cpu, #memory, #battery, #language, #custom-power-menu {
        padding: 0 5px;
        margin-right: 10px;
        color: ${custom.text_color};
      }

      #custom-launcher {
        font-size: 20px;
        color: ${custom.text_color};
        margin-left: 15px;
      }
    '';
  };
}
