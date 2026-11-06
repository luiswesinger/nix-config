# hosts/laptop/additional-hardware-config.nix
{ config, pkgs, lib, ... }:

{
  # ====================================================================
  # HP ENVY x360 (AMD Ryzen 5 4500U / Renoir) Hardware Tuning
  # ====================================================================

  # Battery & energy management (power-profiles-daemon integrates natively with KDE Plasma)
  services.power-profiles-daemon.enable = true;

  # Explicitly disable powertop auto-tune to avoid aggressive USB/Bluetooth power-downs
  powerManagement.powertop.enable = false;

  # Ensure lid-switch events reliably trigger suspend and clear wakeups
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "suspend";
  };

  # Power Management & Suspend/Resume fixes for AMD Ryzen (s2idle) + HP platform
  boot.kernelParams = [
    # Prevents NVMe D3cold sleep timeouts on AMD s2idle
    "nvme.noacpi=1"
    # Enables proper display controller resume for AMD Renoir iGPUs
    "amdgpu.dcdebugmask=0x10"

    # Forces a hardware reset of the keyboard controller on resume
    "i8042.reset=1"
    # Disables PS/2 active multiplexing to avoid input device lockups after sleep
    "i8042.nomux=1"
    # Prevents HP Embedded Controller (EC) from blocking or swallowing wakeup events
    "acpi.ec_no_wakeup=1"
  ];

  # Systemd sleep configuration for reliable suspend recovery
  systemd.sleep.settings.Sleep = {
    SuspendState = "freeze";
    HibernateDelaySec = "0";
  };
}
