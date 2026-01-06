# modules/system/openssh.nix
{ pkgs, ... }:

{
  services.openssh = {
    enable = true;
    settings =  {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
    openFirewall = true;
  };
}
