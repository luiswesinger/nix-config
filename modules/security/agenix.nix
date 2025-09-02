# modules/security/agenix.nix
{ config, pkgs, agenix, mysecrets, ... }:
{
  imports = [
    agenix.nixosModules.default
  ];

  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
  ];

  # You can keep secrets in a more organized way
  age.secrets."my-github-key" = {
    file = "${mysecrets}/github-key.age";
    mode = "0400";
    owner = "luis";
  };
}
