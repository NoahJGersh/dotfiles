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

  # Calibrate display values
  programs.niri.settings.spawn-at-startup = [
    { argv = [ "wl-gammactl" "-c" "0.835" "-b" "1.005" "-g" "1.550" "-m" "DP-1" ]; }
    { argv = [ "wl-gammactl" "-c" "1.000" "-b" "1.010" "-g" "0.990" "-m" "HDMI-A-1" ]; }
  ];
}
