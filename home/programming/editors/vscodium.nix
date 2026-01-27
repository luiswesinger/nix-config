# home/programming/editors/vscodium.nix
{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # -- Python / Data Science --
        # ms-python.vscode-pylance # Funktioniert oft nicht in Codium (Lizenz-Check)
        ms-python.isort
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow
        
        # -- C++ --
        ms-vscode.cpptools

        # -- Theming --
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons

        # -- Tools --
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
      ];

      userSettings = {
        # -- Editor appearance -----------------------------
        "workbench.colorTheme" = "Catppuccin Mocha";
        "window.zoomLevel" = 1;
        
        # -- File handling ----------------------------------
        "files.autoSave" = "afterDelay";

        # -- Editor behavior -------------------------------
        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
        "editor.minimap.enable" = true;
        "editor.minimap.showSlider" = "always";
        
        # -- VSCodium Spezifisches -------------------------
        "telemetry.telemetryLevel" = "off";
        "extensions.verifySignature" = false; 
      };
    };
  };
}
