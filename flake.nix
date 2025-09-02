# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";

    mysecrets = { url = "git@github.com:luiswesinger/secrets"; flake = false; };
  };
  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {
      first-test = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        # Set all input parameters as specialArgs of all sub-modules
        # so that we can use the `agenix` & `mysecrets` in sub-modules
        specialArgs = inputs;
        modules = [
	 ./hosts/first-test/configuration.nix
          # import & decrypt secrets in `mysecrets` in this module
          ./hosts/first-test/secrets/default.nix
        ];
      };
    };
  };
}
