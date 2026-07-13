# modules/system/overlays.nix
{ inputs, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];

  nixpkgs.overlays = [
    (final: prev: {
      nvchad = inputs.nix4nvchad.packages."${prev.system}".nvchad;
    })
    
  ];
}
