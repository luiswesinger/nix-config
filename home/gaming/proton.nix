# /home/gaming/proton.nix
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    protonup
  ];

  # DONT FORGET THE "protonup" COMMAND AFTER INSTALL!
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
      "\${config.home.homeDirectory}/.steam/root/compatibilitytools.d";
  };

}
