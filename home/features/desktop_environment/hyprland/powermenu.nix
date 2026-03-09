# home/features/desktop_environment/hyprland/powermenu.nix
{ pkgs, config, ... }:

let
  colors = config.colorScheme.palette;
  
  powermenu = pkgs.writeShellScriptBin "powermenu" ''
    red='#${colors.base08}'
    green='#${colors.base0B}'
    blue='#${colors.base0D}'
    yellow='#${colors.base0A}'
    gray='#${colors.base03}'

    shutdown="<span color=''${red}'>󰐥</span>"
    reboot="<span color=''${green}'>󰜉</span>"
    lock="<span color=''${blue}'>󰌾</span>"
    suspend="<span color=''${yellow}'>󰤄</span>"
    quit="<span color=''${gray}'>✘</span>"

    yes="<span color=''${green}'>✔</span>"
    no="<span color=''${red}'>✘</span>"

    theme="$HOME/.config/rofi/powermenu-theme.rasi"

    rofi_cmd() {
      rofi -dmenu -theme "''${theme}" -markup-rows
    }

    run_rofi() {
      echo -e "''${shutdown}\n''${reboot}\n''${lock}\n''${suspend}\n''${quit}" | rofi_cmd
    }

    rofi_confirm() {
      echo -e "''${yes}"
    }

    run_cmd() {
      selected="$(rofi_confirm)"
      if [[ "''${selected}" == "''${yes}" ]]; then
        if [[ $1 == '--shutdown' ]]; then
          systemctl poweroff
        elif [[ $1 == '--reboot' ]]; then
          systemctl reboot
        elif [[ $1 == '--suspend' ]]; then
          # hyprlock & # Aktiviere das, wenn du hyprlock nutzt
          systemctl suspend
        fi
      else
        exit 0
      fi
    }

    chosen="$(run_rofi)"
    case "''${chosen}" in
      "''${shutdown}")
        run_cmd --shutdown
        ;;
      "''${reboot}")
        run_cmd --reboot
        ;;
      "''${lock}")
        sleep 0.1
        swaylock # Benötigt das Paket 'swaylock'
        ;;
      "''${suspend}")
        sleep 0.1
        run_cmd --suspend
        ;;
      "''${quit}")
        exit 0
        ;;
    esac
  '';
in
{
  home.packages = with pkgs; [ 
    powermenu 
    swaylock-effects
  ];
}
