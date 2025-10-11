# home/appearance/gtk.nix
{ pkgs, ... }:

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
in
{
  gtk = {
    enable = true;

    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };

    iconTheme = {
      name = "Faltery-Indigo-Dark";
      package = flatery-icon-theme;
    };

    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors;
    };

    font.name = "0xProto Nerd Font Regular 11";
  };

  fonts.fontconfig.enable = true;
  
  home.packages = with pkgs; [
    dracula-theme
    flatery-icon-theme
    catppuccin-cursors
    pkgs.nerd-fonts._0xproto
 ];
}
