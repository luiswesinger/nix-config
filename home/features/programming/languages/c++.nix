# home/programming/languages/c++.nix
{ pkgs, ... }: {

  home.packages = with pkgs; [
    gcc
    libgcc
    gdb
    gnumake
    cmake
    eigen # linear algebra algorithms

    cppman
  ];

}

