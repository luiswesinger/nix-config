# modules/system/services/openssh.nix
{ config, lib, pkgs, ... }:

{
  options.modules.services.openssh.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the OpenSSH daemon with hardened defaults";
  };

  config = lib.mkIf config.modules.services.openssh.enable {
    services.openssh = {
      enable = true;
      settings =  {
        PasswordAuthentication = true;
        PermitRootLogin = "no";
      };
      openFirewall = true;
    };
  };
}
