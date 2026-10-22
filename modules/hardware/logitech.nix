# modules/hardware/logitech.nix
{ config, lib, pkgs, ... }:

{
  options.modules.hardware.logitech.enable = lib.mkEnableOption "Logitech wireless devices and management (Solaar, Bolt, Unifying)";

  config = lib.mkIf config.modules.hardware.logitech.enable {
    # Logitech udev rules for wireless Bolt/Unifying receivers
    hardware.logitech.wireless.enable = true;

    # Solaar GUI with system tray service and battery status
    programs.solaar = {
      enable = true;
      package = pkgs.solaar;
    };
  };
}
