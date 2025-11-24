{ config, inputs, outputs, lib, pkgs, ... }:
{
  imports = [ ] ++ (builtins.attrValues.homeManagerModules);

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = lib.mkDefault "kolastor";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "25.05";
    sessionpath = ["$HOME/.local/bin"];
  };
}
