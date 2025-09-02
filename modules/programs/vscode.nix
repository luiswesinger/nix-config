{ pkgs, ... }:

{
  # Enable VS Code program
  programs.vscode = {
    enable = true;
    # To enable unfree extensions
    enableExtension = true;
    extensions = with pkgs.vscode-extensions; [
      # General extensions
      ms-vscode.cpptools
      ms-vscode.cpptools-extension-pack
      ms-vscode.cmake-tools
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      vadimcn.vscode-lldb
      ms-python.python
      ms-python.vscode-pylance
      james-yu.latex-workshop
      eamodio.gitlens

      # UI and themes
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons

      # Other useful extensions
      # zhuangya.nix-vscode-tool-loader
      # nix-ide.nix-ide
    ];
    userSettings = {
      # Catppuccin theme settings
      "workbench.colorTheme" = "Catppuccin Frappe";
      "workbench.iconTheme" = "catppuccin-frappe";
      # Font settings
      "editor.fontFamily" = "'0xProto Nerd Font Regular', 'Droid Sans Mono', 'monospace'";
      "editor.fontSize" = 14;
    };
  };
}
