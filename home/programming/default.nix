# home/programming/default.nix
{ pkgs, ...}:

{ 
  imports = [
    ./editors/R.nix
    ./editors/vscode.nix

    ./languages/c++.nix
    ./languages/python.nix
  ];

  home.packages = with pkgs; [
    ## Monitor GPU ##
    lact # Linux GPU Configuration Tool for AMD and NVIDIA
    amdgpu_top # Tool to display AMDGPU usage
    nvtopPackages.amd # (h)top like task monitor for AMD, Adreno, Intel and NVIDIA GPUs
  ];
}
