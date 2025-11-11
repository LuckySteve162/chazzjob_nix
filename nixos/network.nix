{ config, ...}

{
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

}
