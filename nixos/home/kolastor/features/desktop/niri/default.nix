{ config, lib, inputs, pkgs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    ../common
    ../common/wayland
  ];

  programs.niri.enable = true;
  programs.niri.settings = {
    environment = {
      "NIXOS_OZONE_WL" = "1";
    };

    layout.focus-ring = {
      active = {
        color = "#7fc8ff";
        gradient = {
          angle = -45;
          from = "#ffa401";
          to = "#3f014a";
        };
      };
      inactive.color = "#505050";
    };

    spawn-at-startup = [
      { argv = ["waybar"]; }
      { argv = ["wpaperd"]; }
    ];

    prefer-no-csd = true;

    window-rules = [
      # Ensure Firefox Picture in Picture is properly floating
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
      }
      # Support gradient border with rounded corners and transparent backgrounds
      # Especially important for Ghostty, which I've configured with semi-transparent BG
      {
        geometry-corner-radius = 12;
        clip-to-geometry = true;
        draw-border-with-background = false;
      }
    ];
  };
}
