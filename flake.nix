# flake.nix
{
  description = "Don't try to understand this flake, I wrote it and still have no clue...";	

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
  
    mysecrets = {
      url = "git@github.com:luiswesinger/secrets";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
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
      # Supported systems for flake packages, shell, etc.
      systems = [
        "x86_64-linux"
      ];
      
      # Function that generates an attribute by calling a function you
      # pass to it, with each system as an argument
      forAllSystems = nixpkgs.lib.genAttrs systems;
      in {

        # nixosModules = import ./modules/nixos;
        # overlays = import ./overlays {inherit inputs};
        homeManagerModules = import ./modules/home-manager;

      # NixOs configuration entrypoint
      # Available through 'nixos-rebuild --flake .#hostname'
      nixosConfigurations = {

        ##########################
        #	   minimal-setup       #
        ##########################
        minimal-setup = nixpkgs.lib.nixosSystem {
	        specialArgs = {inherit inputs outputs;};
	        modules = [
	          ./hosts/minimal-setup/configuration.nix
	        ];  
        };

        ##########################
        #       work-setup       #
        ##########################
        work-setup = nixpkgs.lib.nixosSystem {
	        specialArgs = {inherit inputs outputs;};
	        modules = [
	          ./hosts/work-setup/configuration.nix
	        ];  
        };

      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#luis@luis'
      homeConfiguration = {
        "luis@luis" = home-manager.lib.homeManagerConfiguration {
          # Home-manager requires 'pkgs' instance
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {inherit inputs outputs;};
          modules = [
            # main home-manager configuration file
            ./home-manager/home.nix
          ];
      };
    };
  };
}
