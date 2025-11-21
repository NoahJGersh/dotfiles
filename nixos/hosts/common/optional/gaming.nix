# Gaming related configuration
{ config, pkgs, ... }:
{
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    # Launchers
    lutris
    
    # Supplementary
    adwaita-icon-theme
  ];
}
