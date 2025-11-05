let
  inherit (import <nixpkgs> { }) lib;

  getKeyFromDir = baseDir: childDir: builtins.readFile (baseDir + "/${childDir}/id_ed25519.pub");
  getValidChildren = children: lib.attrsets.mapAttrsToList (name: _: name) children;

  homeDir = ../../../home;
  users = getValidChildren (builtins.readDir homeDir);
  userKeys = builtins.map (user: getKeyFromDir homeDir user) users;

  hostDir = ../../../hosts;
  hosts = getValidChildren (lib.attrsets.filterAttrs (n: _: n != "common") (builtins.readDir hostDir));
  hostKeys = builtins.map (host: getKeyFromDir hostDir host) hosts;
  hostKeyPaths = builtins.map (host: hostDir + "/${host}/id_ed25519") hosts;
in
{
  inherit userKeys hostKeys hostKeyPaths;

  allKeys = userKeys ++ hostKeys;

  kolastorKey = getKeyFromDir homeDir "kolastor";
}
