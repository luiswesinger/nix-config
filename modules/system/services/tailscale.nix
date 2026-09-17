# modules/system/services/tailscale.nix
{ config, lib, pkgs, ... }:

{
  options.modules.services.tailscale.enable = lib.mkEnableOption "Tailscale service";

  config = lib.mkIf config.modules.services.tailscale.enable {
    services.tailscale.enable = true;
  };
}
