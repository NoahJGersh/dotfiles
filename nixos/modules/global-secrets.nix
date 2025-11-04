# Global secrets (e.g. network passwords, VPN auth)
{ config, ... }:
{
  config = {
    age.secrets = {
      network-secrets = {
        file = ./network-secrets.age;
        owner = "root";
        group = "root";
      };
      openvpn-auth = {
        file = ./openvpn-auth.age;
        owner = "root";
        group = "root";
      };
    };
  };
}
