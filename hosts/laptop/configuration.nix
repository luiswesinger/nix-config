# hosts/laptop/configuration.nix
{ config, pkgs, lib, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    
    ../../modules/desktop_environment/kdeplasma6.nix
    #../../modules/desktop_environment/hyprland.nix
    
    ../../modules/system/base
    ../../modules/system/services
    ../../modules/hardware

    ../../modules/system/overlays.nix
  ];

  # background services
  modules.services = {
    docker.enable = true;
    tailscale.enable = false;
    ollama.enable = true;
    virtualisation.enable = true;
  };

  # hardware integrations
  modules.hardware = {
    logitech.enable = true;
  };

  # Battery and Energy management 
  services.power-profiles-daemon.enable = true;
  # Disabled powertop auto-tune to prevent aggressive USB/Bluetooth power down that breaks suspend/resume
  powerManagement.powertop.enable = false;

  # Power Management & Suspend fixes for AMD Ryzen (s2idle) + HP laptop
  boot.kernelParams = [
    # Prevents NVMe sleep timeouts on AMD s2idle
    "nvme.noacpi=1"
    # Helps AMD Renoir APU resume cleanly from modern standby
    "amdgpu.dcdebugmask=0x10"
  ];

  # Systemd sleep configuration for reliable suspend recovery
  systemd.sleep.settings.Sleep = {
    SuspendState = "freeze";
    HibernateDelaySec = "0";
  };

  networking.hostName = "hp-laptop-luis";

  # Define the user luis and link his home-manager configuration
  users.users.luis = {
    isNormalUser = true;
    description = "luis";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Enable a swap file for memory cushioning
  swapDevices = [
    {
      # The size of the swap file in MiB. 4096 MiB = 4 GiB
      device = "/swapfile";
      size = 4096;
    }
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  programs = {
    zsh.enable = true;
  };
}

