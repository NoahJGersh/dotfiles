{ pkgs, config, lib, ... }:
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  users.users.kolastor = {
    isNormalUser = true;
    extraGroups = ifTheyExist [
      "audio"
      "git"
      "network"
      "video"
      "wheel"
    ];

    openssh.authorizedKeys.keys = lib.splitString "\n" (builtins.readFile ../../../../home/kolastor/id_ed25519.pub);
    # hashedPasswordFile = config.age.secrets.kolastor-password.path;
    # packages = [ pkgs.home-manager ];
  };

  # age.secrets.kolastor-password = {
  #   file = ../../secrets/kolastor-password.age;
  #   owner = "root";
  #   group = "root";
  # };

  # home-manager.users.kolastor = import ../../../../home/kolastor/${config.networking.hostName}.nix;

  security.pam.services = {
    swaylock = {};
  };
}
