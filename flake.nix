# flake.nix
{
  description = "A professional NixOS config for software development";	

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
  
    mysecrets = {
      url = "git@github.com:luiswesinger/secrets";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {


      ##########################
      #     first-test host    #
      ##########################
      first-test = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
	  ./hosts/first-test/configuration.nix
          ./modules/programs/neovim.nix
	  ./modules/programs/kitty.nix
	  ./modules/programs/vscode.nix
	];
      };


      ##########################
      #	   second-test host    #
      ##########################
      second-test = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = inputs;
	modules = [
	];
      };


    };
  };
}
