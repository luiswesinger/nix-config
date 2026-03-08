# home/programming/languages/c++.nix
{ pkgs, ... }: {

  home.packages = with pkgs; [
    gdb
    gnumake
    cmake
    clang
    eigen # linear algebra algorithms

    cppman
  ];

}

