{ config, pkgs, ... }:
{
  imports = [
    ./discord.nix
    ./firefox.nix
    ./pavucontrol.nix
  ];
}
