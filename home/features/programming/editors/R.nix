# home/programming/editors/R.nix
{ pkgs, ... }: {

  home.packages = with pkgs; [
    rstudio
  ];

}


