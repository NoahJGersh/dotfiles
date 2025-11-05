# secrets.nix - used for agenix encryption/decryption of secrets
let 
  inherit (import ../../../utils/ssh-keys.nix ) allKeys hostKeys noahgKey;
in
{
  # Users
  "noahg-password.age".publicKeys = [ noahgKey ] ++ hostKeys;

  # Networking
  "network-passwords.age".publicKeys = allKeys;
  "openvpn-auth.age".publicKeys = allKeys;
  "openvpn-ca.age".publicKeys = allKeys;
  "openvpn-tls.age".publicKeys = allKeys;
}
