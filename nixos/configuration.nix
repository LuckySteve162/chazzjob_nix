{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # System identity
  networking.hostName = "xenix";
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
  users.users.luckyxen = {
    isNormalUser = true;
    extraGroups = [ 
    "wheel" # For sudo
    ]; 
    packages = with pkgs; [  ];
  };

  # Graphics
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  # Wayland environment
  programs.sway.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # Core system services
  services.dbus.enable = true;

  # Grafana

  # Elastic Search
  services.elastic = {
    enable = truel;
  };

  # Logstash
  service.logstash = {
    service = enable;
    logLevel = "warn";
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    # Core environment
    sway wofi wezterm tmux ranger

    # UI / UX

    # Logging & Siem
    #grafana logstash elasticsearch

    # Browser
    brave

    # Audio
    pulsemixer pipewire wireplumber

    # Text Editor
    neovim

    # Power & lock

    # Networking

    # Utilities
    btop git stow ffmpeg
  ];

  system.stateVersion = "25.05";
}
