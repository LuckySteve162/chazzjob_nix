{config, pkgs, ... }

{
  # Wayland environment
  programs.sway.enable = true;
  programs.waybar.enable = true;

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "sway";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    # Core environment
    sway wofi wezterm tmux ranger networkmanager

    # UI / UX

    # Logging & Siem
    #grafana logstash elasticsearch

    # Sunshine
    sunshine

    # Browser
    brave

    # Audio
    pulsemixer pipewire wireplumber

    # Text Editor
    neovim

    # Power & lock

    # Virtualisation
    libvirt virt-manager qemu qemu_kvm

    # Utilities
    btop git stow ffmpeg
  ];
}
