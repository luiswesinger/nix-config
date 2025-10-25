# flake.nix

{
  description = "Don't try to understand this flake, I wrote it and still have no clue...";	

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-colors.url = "github:misterio77/nix-colors";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs = {
	nixpkgs.follows = "nixpkgs";
      };
    };

    base16.url = "github:SenchoPens/base16.nix";

    hyprland = {
      url = "github:hyprwm/Hyprland";
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
      #    Laptop-Setup
      # --------------------------------------------
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/laptop/configuration.nix
        ];
      };

      # --------------------------------------------
      #    Desktop-Setup
      # --------------------------------------------
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available thorugh 'home-manager --flake .#username@hostname'
    homeConfigurations = {

      # -- home config for LAPTOP -- #
      "luis@laptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
	  # choose home config here
          ./home/uni.nix
        ];
      };

      # -- home config for DESKTOP -- #
      "luis@desktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
	  # choose home config here
	  ./home/leisure.nix
        ];
      };

    };
  };
}
