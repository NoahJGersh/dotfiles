{ pkgs, config, lib, ... }:
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  users.users.noahg = {
    isNormalUser = true;
    extraGroups = ifTheyExist [
      "audio"
      "git"
      "network"
      "video"
      "wheel"
    ];

    openssh.authorizedKeys.keys = lib.splitString "\n" (builtins.readFile ../../../../home/noahg/id_ed25519.pub);
    hashedPasswordFile = config.age.secrets.noahg-password.path;
    # packages = [ pkgs.home-manager ];
  };

  age.secrets.noahg-password = {
    file = ../../secrets/noahg-password.age;
    owner = "root";
    group = "root";
  };

  # home-manager.users.noahg = import ../../../../home/noahg/${config.networking.hostName}.nix;

  security.pam.services = {
    swaylock = {};
  };
}
