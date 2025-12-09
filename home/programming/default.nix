{ 
  imports = [
    ./ssh.nix

    ./editors/R.nix
    ./editors/vscode.nix

    ./languages/c++.nix
    ./languages/python.nix
  ];
}
