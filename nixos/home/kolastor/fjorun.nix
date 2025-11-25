{ config, pkgs, ... }:
{
  imports = [
    ./global

    ./features/desktop/niri
  ];

  # LG Ultrawide
  programs.niri.settings.outputs."DP-1" = {
    mode = {
      width = 2560;
      height = 1080;
      refresh = 144.001;
    };
    variable-refresh-rate = "on-demand";
    focus-at-startup = true;
  };

  # Dell 16:9
  programs.niri.settings.outputs."HDMI-A-1" = {
    mode = {
      width = 2560;
      height = 1440;
      refresh = 144.000;
    };
  };
}
