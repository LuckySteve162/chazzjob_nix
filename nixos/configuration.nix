{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./client.nix
    ./virtualisation.nix
    ./network.nix
    ./env.nix
  ];
#
  # System identity
  networking.hostName = "chazznix";
  time.timeZone = "America/Chicago";

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # PCI Passthrough
  boot.kernelParams = [
    "intel_iommu=on"
    "iommu=pt"
    "vfio-pci.ids="
  ];
  boot.initrd.kernelModules = [
    "vfio_pci"
    "vfio"
    "vfio_iommu_type1"
  ];

  # OpenSSH daemon
  services.openssh.enable = true;

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  # User with sudo access
  users.users.luckysteve = {
    isNormalUser = true;
    extraGroups = [ "libvirtd" ];
  };

  # Graphics
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  # ly
  services.displayManager = {
    enable = true;
    ly.settings = {
      load = true;
      save = true;
    };
    ly.enable = true;
  }; 

  # Core system services
  services.dbus.enable = true;

  # Sunshine RDP
  services.sunshine = {
    enable = true;
    autoStart = true;
  }

  # Grafana

  # Elastic Search
  services.elastic = {
    enable = true;
  };

  # Logstash
  service.logstash = {
    service = enable;
    logLevel = "warn";
  };
  
  system.stateVersion = "25.05";
}
