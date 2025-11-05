{ config, ... }:
{
  networking.networkmanager.enable = true;
  networking.networkmanager.ensureProfiles = {
    environmentFiles = [ config.age.secrets.network-passwords.path ];
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
    };
  };
}
