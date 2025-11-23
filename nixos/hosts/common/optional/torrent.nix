{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ transmission_4-gtk ];
  
  # Open firewall for Transmission
  networking.firewall.allowedTCPPorts = [ 51413 ];
}
