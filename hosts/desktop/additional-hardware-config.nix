# /hosts/desktop/additional-hardware-config.nix
{ config, pkgs, lib, ... }:

{
  # ====================================================================
  # AMD CPU / B450 CHIPSET KONFIGURATION 
  # ====================================================================

  # Microcode-Update für AMD CPUs (Ryzen 5 3600X)
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;

  # Chipsatz-Treiber (B450 IOMMU)
  boot.kernelParams = [
    "amd_iommu=on"
    "iommu=pt"
  ];

  # Intel Gigabit Ethernet (I211-AT)
  boot.kernelModules = [ "igb" ];

  # ====================================================================
  # AMD GRAFIK (RX 5700 XT) & WAYLAND-OPTIMIERUNG
  # ====================================================================

  # Festlegung des Videotreibers
  services.xserver.videoDrivers = [ "amdgpu" ];

  # AMD GPU Treiber und Firmware (WICHTIG für RX 5700 XT)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    
    extraPackages = with pkgs; [
      amdgpu_top
    ];
  };

  # Wayland-Spezifische Anpassungen
  # Wichtig für KDE Plasma (Kwin) unter Wayland und zur besseren
  # Nutzung von Hardware-Beschleunigung in Anwendungen (z.B. Firefox, Electron Apps).
  # Dies kann auch in einem DE-spezifischen Modul stehen, ist aber hardwarenah.
  # Ermöglicht Hardware Video Acceleration (VA-API).
  environment.sessionVariables = {
    # AMD VA-API und Vulkan-Treiber-Pfad-Fixes
    VDPAU_DRIVER = lib.mkDefault "radeonsi";
    LIBVA_DRIVER_NAME = lib.mkDefault "radeonsi";
    
    # Wayland-Spezifisches: Erzwinge die Nutzung der AMDGPU-Stack
    MESA_LOADER_DRIVER_OVERRIDE = lib.mkDefault "radeonsi"; 
  };
}
