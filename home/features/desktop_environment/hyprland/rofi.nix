# home/features/desktop_environment/hyprland/rofi.nix
{ config, pkgs, ... }:

let
  colors = config.colorScheme.palette;
in
{
  programs.rofi = {
    enable = true;
  };

  # theme.rasi with nix-colors
  xdg.configFile."rofi/theme.rasi".text = ''
    * {
        bg-col: #${colors.base00};
        bg-col-light: #${colors.base01};
        border-col: #${colors.base03};
        selected-col: #${colors.base02};
        green: #${colors.base0B};
        fg-col: #${colors.base05};
        fg-col2: #${colors.base06};
        grey: #${colors.base03};
        highlight: @green;
        element-bg: #${colors.base01};
        element-alternate-bg: #${colors.base00};
    }
  '';

  # main-config
  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
        modi: "run,drun,window";
        lines: 5;
        cycle: false;
        font: "Proto Nerd Font Bold 16";
        show-icons: true;
        icon-theme: "Papirus-dark";
        terminal: "kitty";
        drun-display-format: "{icon} {name}";
        location: 0;
        disable-history: true;
        hide-scrollbar: true;
        display-drun: " Apps ";
        display-run: " Run ";
        display-window: " Window ";
        sidebar-mode: true;
    }

    @theme "theme"

    element-text, element-icon , mode-switcher {
        background-color: inherit;
        text-color:       inherit;
    }

    window {
        height: 539px;
        width: 400px;
        border: 2px;
        border-color: @border-col;
        background-color: @bg-col;
    }

    mainbox { background-color: @bg-col; }

    inputbar {
        children: [prompt,entry];
        background-color: @bg-col-light;
        padding: 0px;
    }

    prompt {
        background-color: @green;
        padding: 4px;
        text-color: @bg-col-light;
        margin: 10px 0px 10px 10px;
    }

    entry {
        padding: 6px;
        margin: 10px 10px 10px 5px;
        text-color: @fg-col;
        background-color: @bg-col;
    }

    listview {
        border: 0px 0px 0px;
        padding: 0px;
        margin: 0px;
        columns: 1;
        background-color: @bg-col;
        cycle: true;
    }

    element {
        padding: 8px;
        background-color: @element-bg;
        text-color: @fg-col;
    }

    element-icon { size: 28px; }

    element selected {
        background-color:  @selected-col ;
        text-color: @fg-col2 ;
    }

    mode-switcher { spacing: 0; }

    button {
        padding: 10px;
        background-color: @bg-col-light;
        text-color: @grey;
        vertical-align: 0.5;
        horizontal-align: 0.5;
    }

    button selected {
        background-color: @bg-col;
        text-color: @green;
    }
  '';

  # powermenue 
  xdg.configFile."rofi/powermenu-theme.rasi".text = ''
    @theme "theme"

    configuration {
        show-icons: false;
        font: "Proto Nerd Font Bold 26";
    }

    window {
        width: 500px;
        location: center;
        anchor: center;
        border: 2px solid;
        border-color: @border-col;
        background-color: @bg-col;
    }

    mainbox {
        enabled: true;
        background-color: inherit;
        children: [ "listview" ];
    }

    listview {
        enabled: true;
        lines: 1;
        columns: 5;
        cycle: true;
        scrollbar: false;
        layout: vertical;
        spacing: 0px;
        background-color: transparent;
    }

    element {
        enabled: true;
        padding: 28px 0px;
        background-color: inherit;
        text-color: @fg-col;
        cursor: pointer;
    }

    element-text {
        vertical-align: 0.5;
        horizontal-align: 0.5;
        text-color: inherit;
        background-color: transparent;
    }

    element selected.normal {
        background-color: @selected-col;
    }
  '';
}
