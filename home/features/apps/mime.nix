# home/features/apps/mime.nix
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    imv 
    mpv
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # web links
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";

      # PDFs
      "application/pdf" = "org.pwmt.zathura.desktop";

      # Images 
      "image/jpeg" = "imv.desktop";
      "image/png" = "imv.desktop";
      "image/gif" = "imv.desktop";
      "image/webp" = "imv.desktop";

      # Video/Audio
      "video/mp4" = "mpv.desktop";
      "video/mkv" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "audio/mpeg" = "mpv.desktop";
    };
  };
}
