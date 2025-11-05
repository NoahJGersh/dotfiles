# VPN-related network config
{ config, ... }:
{
  # Set up VPN servers
  services.openvpn.servers = {

    # Fastest server
    protonVPN = {
      config = ''
        config ../../../openvpn/protonVPN_US-CA.conf
        auth-user-pass ${config.age.secrets.openvpn-auth.path}
        ca ${config.age.secrets.openvpn-ca.path}
        tls-auth ${config.age.secrets.openvpn-tls.path} 1
      '';
      updateResolvConf = true;
    };

    # UK server for travel
    # protonVPN_UK = {
      # TODO
    # };
  };

  networking.networkmanager.dns = "systemd-resolved";
}
