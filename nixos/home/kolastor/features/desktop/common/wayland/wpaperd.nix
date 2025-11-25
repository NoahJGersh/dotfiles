{ config, ... }:
{
  services.wpaperd.enable = true;

  xdg.configFile."wpaperd/wallpaper.toml".text = "";
}
