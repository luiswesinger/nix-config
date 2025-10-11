# home/appearance/gtk.nix
{ pkgs, ... }:

let
  flatery-icon-theme = pkgs.stdenv.mkDerivation {
    pname = "flatery-icon-theme";
    version = "2025-01-01";
    src = pkgs.fetchFromGitHub {
      owner = "cbrnix";
      repo = "Flatery";
      rev = "30bef81ba98ac4c4f764e9fc1b705a86e0d27e2c"; # specific commit for stability
      sha256 = "0vv507v0ijjdpbfy57b9skyp4qql5f5pdd9ja0bcbc0l2gmp7pma"; # update if needed
    };

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
