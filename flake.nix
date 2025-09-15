# flake.nix
{
  description = "Don't try to understand this flake, I wrote it and still have no clue...";	

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mysecrets = {
      url = "git@github.com:luiswesinger/secrets";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self,
    nixpkgs,
    home-manager,
    ... 
    } @ inputs: let
      inherit (self) outputs;
    
    in {

    # NixOS System configuration entrypoint
    # Available thorugh 'sudo nixos-rebuild switch --flake .#hostname'
    nixosConfigurations = {

      # --------------------------------------------
      #     University-Setup
      # --------------------------------------------
      uni = nixpkgs.lib.nixSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available thorugh 'home-manager --flake .#username@hostname'
    homeConfigurations = {
      "luis@uni" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
  };
}
