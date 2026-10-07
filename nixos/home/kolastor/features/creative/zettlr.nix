{ config, pkgs, ... }:
{
  imports = [
    ../desktop/common/texlive.nix
  ];

  home.packages = with pkgs; [
    zettlr
  ];
}
