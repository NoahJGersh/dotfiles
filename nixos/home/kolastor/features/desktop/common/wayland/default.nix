{ pkgs, ...}:
{
  imports = [
    ./mako.nix
    ./waybar.nix
    ./fuzzel.nix
  ];
}
