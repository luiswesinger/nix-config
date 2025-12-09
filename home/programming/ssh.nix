# home/programming/ssh.nix
{ ... }:

{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    identitiesOnly = true;
    identities = [
      {
        file = ".ssh/id_ed25519.txt";
      }
    ];
  };
}
