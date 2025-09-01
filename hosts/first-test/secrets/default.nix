{ config, pkgs, agenix, mysecrets, ... }: {
  imports = [
     agenix.nixosModules.default
  ];

  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
  ];

  age.secrets."first-test-secret" = {
    symlink = true;
    path = "/etc/nixos/first-test-secret.json"; # decrypted and stored here
    file =  "${mysecrets}/first-test-secret.age"; #encrypted file in secrets repo
    mode = "0400";
    owner = "root";
    group = "root";
  };
}
