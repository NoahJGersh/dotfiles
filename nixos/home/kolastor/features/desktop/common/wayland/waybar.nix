{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings.mainBar.layer = "top";
    systemd.enable = true;
  };
}
