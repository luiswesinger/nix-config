# hosts/modules/system/overlays.nix
{ inputs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      nvchad = inputs.nix4nvchad.packages."${prev.system}".nvchad;
    })
    # Future overlays go here!
  ];
}
