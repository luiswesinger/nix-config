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

    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
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
    } @ inputs: {

    # NixOS System configuration entrypoint
    # Available thorugh 'sudo nixos-rebuild switch --flake .#hostname'
    nixosConfigurations = {

      # --------------------------------------------
      #    Laptop-Setup
      # --------------------------------------------
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.luis = import ./home/uni.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.backupFileExtension = "backup";
          }
          ./hosts/laptop/configuration.nix
        ];
      };

      # --------------------------------------------
      #    Desktop-Setup
      # --------------------------------------------
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.luis = import ./home/leisure.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.backupFileExtension = "backup";
          }
          ./hosts/desktop/configuration.nix
        ];
      };
    };
  };
}
