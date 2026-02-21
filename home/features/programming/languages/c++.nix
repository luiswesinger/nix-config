# home/programming/languages/c++.nix
{ pkgs, ... }: {

  home.packages = with pkgs; [
    gdb
    cmake
    clang
    eigen # linear algebra algorithms

    cppman
  ];

}

