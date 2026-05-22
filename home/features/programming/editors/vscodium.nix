# home/programming/editors/vscodium.nix
{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;
    
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # -- LaTeX --
        james-yu.latex-workshop

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
       # -- Startup behavior ------------------------------
        "workbench.welcomePage.tasks.showTips" = false;
        "workbench.startupEditor" = "none";
        "workbench.tips.enabled" = false;

       # -- LaTeX Workshop Settings -----------------------
        "latex-workshop.view.pdf.viewer" = "tab"; 
        "latex-workshop.latex.autoBuild.run" = "onFileChange"; 
        "latex-workshop.latex.outDir" = "%DIR%/build"; 
        "latex-workshop.view.pdf.internal.synctex.keybinding" = "double-click"; 

        # -- Editor appearance -----------------------------
        "window.zoomLevel" = 1;
        
        # -- File handling ----------------------------------
        "files.autoSave" = "afterDelay";

        # -- Editor behavior -------------------------------
        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
        "editor.minimap.enable" = true;
        "editor.minimap.showSlider" = "always";
        
        # -- VSCodium specific ------------------------------
        "telemetry.telemetryLevel" = "off";
        "extensions.verifySignature" = false; 
      };
    };
  };
}
