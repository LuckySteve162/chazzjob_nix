{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./client.nix
  ];

  # System identity
  networking.hostName = "xenix1";
  time.timeZone = "America/Chicago";

  # Networking
  networking = {
    useDHCP = true;
    firewall = {
      allowedTCPPorts = [ 
        47984 47989 47990 48010 # For Sunshine RDP
        ];
      allowedUDPPorts = [ 
        47998 47999 48000 48010 # For Sunshine RDP
        ];
    };
    # DNS Management
    nameservers = [ "1.1.1.1" ];
  };

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # OpenSSH daemon
  services.openssh.enable = true;

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  # User with sudo access
  users.users.luckysteve = {
    isSystemUser = true;
    initialPassword = "test";
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
