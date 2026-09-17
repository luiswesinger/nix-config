# modules/system/services/tailscale.nix
{ pkgs, ... }:

{
  # Tailscale for remote work
  services.tailscale.enable = true; 
}
