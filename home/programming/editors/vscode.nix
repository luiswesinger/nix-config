# home/programming/vscode.nix
{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    # Use the official Microsoft build (unfree)
    package = pkgs.vscode;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        #ms-python.vscode-pylance
        ms-python.isort
        ms-toolsai.jupyter
	ms-toolsai.jupyter-keymap
	ms-toolsai.vscode-jupyter-cell-tags
	ms-toolsai.vscode-jupyter-slideshow

	ms-vscode.cpptools

        #github.copilot
        ms-vscode-remote.remote-ssh

        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons

	jnoortheen.nix-ide
	mechatroner.rainbow-csv
      ];

      userSettings = {
        # -- Editor appearance -----------------------------
        "workbench.colorTheme" = "Catppuccin Mocha";
	"window.zoomLevel" = 1;
        
	# -- File handling ----------------------------------
        "files.autoSave" = "afterDelay";

	# -- Editor beahavoir -------------------------------
	"editor.tabSize" = 2;
	"editor.insertSpaces" = true;
	"editor.minimap.enable" = true;
	"editor.minimap.showSlider" = "always";

      };
    };
  };
}

