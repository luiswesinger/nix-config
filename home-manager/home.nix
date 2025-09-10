# home-manager.nix
{
  inputs, 
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Modules which gets exported by the flake (from modules/home-manager):
    ../modules/home-manager/nixvim.nix
    # outputs.homeManagerModules.example
    inputs.self.homeManagerModules.default
  ];

  nixpkgs = {
    # add overlays if needed
  };

  home = {
    username = "luis";
    homeDirectory = "/home/luis";
  };

  programs.home-manager.enable = true;  # enable home-manager
  programs.git.enable = true;           # enable git
  
  programs.git = {
    enable = true;
    userName = "Luis Wesinger";
    userEmail = "wesingerluis@gmail.com";
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      # add vscode extensions here
      ms-python.python
    ];
  };

  # Nicely reload system units when changing configs
  systemd.user.startService = "sd-switch";

  home.stateVersion = "25.05";
}
