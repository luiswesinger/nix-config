# home/programming/tools/docker.nix
{ pkgs, ... }: {

  home.packages = with pkgs; [
    docker
    docker-compose
    docker-buildx
    lazydocker
  ];

}

