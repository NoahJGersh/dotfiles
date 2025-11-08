{ pkgs, config, lib, ... }:
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = true;
  users.users.kolastor = {
    isNormalUser = true;
    extraGroups = ifTheyExist [
      "audio"
      "git"
      "network"
      "video"
      "wheel"
    ];

    # openssh.authorizedKeys.keys = lib.splitString "\n" (builtins.readFile ../../../../home/kolastor/id_ed25519.pub);
    hashedPasswordFile = config.sops.secrets.kolastor-password.path;
    # packages = [ pkgs.home-manager ];
  };

  sops.secrets.kolastor-password = {
    sopsFile = ../../secrets/passwords.yaml;
    neededForUsers = true;
  };

  # home-manager.users.kolastor = import ../../../../home/kolastor/${config.networking.hostName}.nix;

  security.pam.services = {
    swaylock = {};
  };
}
