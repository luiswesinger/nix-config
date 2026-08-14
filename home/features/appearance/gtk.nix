# home/features/appearance/gtk.nix
{ pkgs, config, ... }:

let
  flatery-icon-theme = pkgs.stdenv.mkDerivation {
    pname = "flatery-icon-theme";
    version = "2025-01-01";
    src = pkgs.fetchFromGitHub {
      owner = "cbrnix";
      repo = "Flatery";
      rev = "59ebcf4cb7a68c8635d1b77e4d20c3b072df4d58"; # specific commit for stability
      sha256 = "1s5hgy1jaq4r6jsc7k4xqp3aa5bjyxczchqgb4p9nblw2dprqalg"; # update if needed
    };

    dontPatchShebangs = true;
    patchPhase = ":";
    fixupPhase = ":";
    checkPhase = ":";

    installPhase = ''
      mkdir -p $out/share/icons
      cp -r Flatery* $out/share/icons/
    '';
  };

  dracula-gtk-theme = pkgs.stdenv.mkDerivation {
    pname = "dracula-gtk-theme";
    version = "unstable";
    src = pkgs.fetchFromGitHub {
      owner = "dracula";
      repo = "gtk";
      rev = "master";
      sha256 = "sha256-5v7hWqG/XvFpYm3q7Y3vO/qB9I/3h8j6c3J0Z7Z7Z7Z=";
    };

    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/themes/Dracula
      cp -r * $out/share/themes/Dracula/
    '';
  };
in
{
  gtk = {
    enable = true;

    theme = {
      name = "Dracula";
      package = dracula-gtk-theme;
    };

    gtk4.theme = config.gtk.theme;

    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors;
    };

    iconTheme = {
      name = "Dracula-Icon-Theme";
      package = pkgs.dracula-icon-theme;

      #name = "Flatery-Indigo-Dark";
      #package = flatery-icon-theme;
    };

    font.name = "Roboto Mono 12";
    #font.name = "0xProto Nerd Font Regular 12";
  };

  fonts.fontconfig.enable = true;
  
  home.packages = with pkgs; [
    flatery-icon-theme
    dracula-icon-theme
    dracula-gtk-theme
    catppuccin-cursors
    pkgs.nerd-fonts._0xproto
    pkgs.nerd-fonts.roboto-mono
 ];
}
