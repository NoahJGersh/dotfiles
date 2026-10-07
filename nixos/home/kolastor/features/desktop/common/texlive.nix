{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    texliveBasic
  ];
}
