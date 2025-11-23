{ config, ... }:
{
  networking.wg-quick.interfaces = {
    protonVPN_fast = {
      autostart = true;
      address = [
        "10.2.0.2/32"
      ];
      dns = [
        "10.2.0.1"
      ];
      peers = [
        {
          allowedIPs = [
            "0.0.0.0/0"
            "::/0"
          ];
          endpoint = "79.127.185.166:51820";
          publicKey = "2xvxhMK0AalXOMq6Dh0QMVJ0Cl3WQTmWT5tdeb8SpR0=";
        }
      ];
      privateKeyFile = config.sops.secrets.protonvpn-us-ca-private-key.path;
    };
  };

  sops.secrets.protonvpn-us-ca-private-key = {
    sopsFile = ../secrets/vpn.yaml;
    key = "protonvpn/us-ca/private_key";
  };
}
