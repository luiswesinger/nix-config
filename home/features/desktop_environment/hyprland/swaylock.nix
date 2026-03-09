{ config, pkgs, ... }:

let
  colors = config.colorScheme.palette;
in
{
  programs.swaylock = {
    enable = true;

    package = pkgs.swaylock-effects;

    settings = {
      clock = true;
      daemonize = true;
      # timestr="%H:%M";
      datestr = "";
      screenshots = true;
      ignore-empty-password = true;

      indicator = true;
      indicator-radius = 111;
      indicator-thickness = 9;

      effect-blur = "7x5";
      effect-vignette = "0.75:0.75";
      effect-pixelate = 5;

      font = "Maple Mono";

      text-wrong-color = "${colors.base08}ff";
      text-ver-color = "${colors.base05}ff";
      text-clear-color = "${colors.base05}ff";
      key-hl-color = "${colors.base0A}ff";
      bs-hl-color = "${colors.base08}ff";
      ring-clear-color = "${colors.base09}ff";
      ring-wrong-color = "${colors.base08}ff";
      ring-ver-color = "${colors.base0B}ff";
      ring-color = "${colors.base0D}ff";
      line-clear-color = "FFFFFF00";
      line-ver-color = "FFFFFF00";
      line-wrong-color = "FFFFFF00";
      separator-color = "FFFFFF00";
      line-color = "FFFFFF00";
      text-color = "${colors.base05}ff";
      inside-color = "${colors.base00}dd";
      inside-ver-color = "${colors.base00}dd";
      inside-clear-color = "${colors.base00}dd";
      inside-wrong-color = "${colors.base00}dd";
      layout-bg-color = "FFFFFF00";
      layout-text-color = "${colors.base05}ff";
    };
  };
}