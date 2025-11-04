# Enable vim as default editor
{ config, ... }:
{
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
}
