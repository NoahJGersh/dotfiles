{ pkgs, ...}:
{
  imports = [
    ./mako.nix
    ./wl-gammactl.nix
    ./wpaperd.nix
  ];
}
