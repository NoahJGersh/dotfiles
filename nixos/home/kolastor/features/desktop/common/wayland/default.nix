{ pkgs, ...}:
{
  imports = [
    ./mako.nix
    ./wl-gammactl.nix
    ./waybar.nix
    ./wpaperd.nix
  ];
}
