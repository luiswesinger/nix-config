# home/python.nix
{ pkgs, ... }: {

  home.packages = [
    (
      pkgs.python313.withPackages (ps: with ps; [
        pip
        setuptools
        wheel
        numpy
        pandas
        matplotlib
        jupyter
        ipykernel

	#python packages for uni
	scikit-learn
	seaborn
	scipy
	mathutils
	statsmodels
      ])
    )
  ];

}

