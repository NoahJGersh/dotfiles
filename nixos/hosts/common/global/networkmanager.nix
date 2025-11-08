{ config, ... }:
{
  networking.networkmanager.enable = true;
  networking.networkmanager.ensureProfiles = {
    environmentFiles = [
      (if (config ? sops) then config.sops.secrets.network-psks.path else "")
    ];
    profiles = {
      Hedgehog = {
        connection = {
          id = "Hedgehog";
          type = "wifi";
        };
        ipv4.method = "auto";
        ipv6 = {
          addr-gen-mode = "stable-privacy";
          method = "auto";
        };
        wifi = {
          mode = "infrastructure";
          ssid = "Hedgehog";
        };
        wifi-security = {
          key-mgmt = "wpa-psk";
          psk = "$HEDGEHOG_PSK";
        };
      };
      Hedgehog_5G = {
        connection = {
          id = "Hedgehog 5G";
          type = "wifi";
        };
        ipv4.method = "auto";
        ipv6 = {
          addr-gen-mode = "stable-privacy";
          method = "auto";
        };
        wifi = {
          mode = "infrastructure";
          ssid = "Hedgehog 5G";
        };
        wifi-security = {
          key-mgmt = "wpa-psk";
          psk = "$HEDGEHOG5G_PSK";
        };
      };
    };
  };
}
