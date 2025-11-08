{ config, ... }:
{
  # Known network PSKs
  sops.secrets.network-psks = {
    sopsFile = ./networks.yaml;
  };
}
