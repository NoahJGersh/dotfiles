{ config, ... }:
{
  sops.secrets.protonvpn-us-ca-private-key = {
    sopsFile = ./vpn.yaml;
    key = "protonvpn/us-ca/private_key";
  };

  sops.secrets.protonvpn-uk-private-key = {
    sopsFile = ./vpn.yaml;
    key = "protonvpn/uk/private_key";
  };
}

