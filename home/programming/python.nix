# home/programming/python.nix
{ pkgs, ... }: {

  home.packages = [
    (
      pkgs.python313.withPackages (ps: with ps; [
        wheel
        numpy
        matplotlib
        ipykernel
      ])
    )
  ];

}

