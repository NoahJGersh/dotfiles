{ pkgs, ...}:
{
  imports = [
    ./mako.nix
    ./waybar.nix
    ./fuzzel.nix
    ./wl-gammactl.nix
  ];
}
