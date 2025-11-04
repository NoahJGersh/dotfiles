# Display Manager configuration
{ config, ... }:
{
  services.displayManager.enable = true;
  services.displayManager.ly.enable = true;
}
