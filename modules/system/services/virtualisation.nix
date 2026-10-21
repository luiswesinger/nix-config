# modules/system/services/virtualisation.nix
{ config, lib, pkgs, ... }:

{
  options.modules.services.virtualisation.enable = lib.mkEnableOption "Libvirt & Virt-Manager virtualization environment (KVM/QEMU)";

  config = lib.mkIf config.modules.services.virtualisation.enable {
    # KVM / QEMU hypervisor daemon
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true; # Emulated TPM 2.0 (needed for Windows 11 & modern OS security)
        # Note: OVMF UEFI firmware is included by default with QEMU in modern NixOS
      };
    };

    # Virt-Manager desktop GUI for managing all kinds of VMs (Linux, Windows, BSD, etc.)
    programs.virt-manager.enable = true;

    # Allow user luis to manage VMs without needing root/sudo permissions
    users.users.luis.extraGroups = [ "libvirtd" ];

    # Packages helpful for VM guests:
    # - virtio-win: Drivers for Windows guests (at /run/current-system/sw/share/virtio-win/virtio-win.iso)
    # - spice-gtk: Enhanced display, audio & clipboard sharing between host and VM
    environment.systemPackages = with pkgs; [
      virtio-win
      spice-gtk
    ];
  };
}
