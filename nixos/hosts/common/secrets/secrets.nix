# secrets.nix - used for agenix encryption/decryption of secrets
let 
  inherit (import <nixpkgs> { }) lib;

  getKeyFromDir = baseDir: childDir: builtins.readFile (baseDir + "/${childDir}/id_ed25519.pub");
  getValidChildren = children: lib.attrsets.mapAttrsToList (name: _: name) children;

  homeDir = ../../../home;
  users = getValidChildren (builtins.readDir homeDir);
  userKeys = builtins.map (user: getKeyFromDir homeDir user) users;

  hostDir = ../../../hosts;
  hosts = getValidChildren (lib.attrsets.filterAttrs (n: _: n != "common") (builtins.readDir hostDir));
  systemKeys = builtins.map (system: getKeyFromDir hostDir system) hosts;

  allKeys = userKeys ++ systemKeys;

  # Granular keys for specific purposes, e.g. user passwords
  noahgKey = getKeyFromDir homeDir "noahg";
in
{
  # Users
  "noahg-password.age".publicKeys = [ noahgKey ] ++ systemKeys;

  # Networking
  "network-secrets.age".publicKeys = allKeys;
  "openvpn-auth.age".publicKeys = allKeys;
}
