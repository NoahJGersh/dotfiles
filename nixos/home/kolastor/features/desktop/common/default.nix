{ config, pkgs, ... }:
{
  imports = [
    ./cursors.nix
    ./discord.nix
    ./firefox.nix
    ./pavucontrol.nix
    ./vlc.nix
  ];
}
