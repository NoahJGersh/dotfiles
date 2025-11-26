# My Dotfiles

This repo contains all of my NixOS system/user configuration.

Notably, my flake-based configuration follows the general patterning and principles of [Misterio77's nix-config](https://github.com/Misterio77/nix-config). 

## Deploying

The configuration's root flake is located in the `nixos/` subdirectory. As such, the configuration can be deployed as follows:

```
sudo nixos-rebuild switch --flake github:NoahJGersh/dotfiles?dir=nixos#warpcurrent
```

Do note that NixOS should be pre-installed to generate the proper `hardware-configuration.nix`, and to have a proper host SSH key for `sops-nix` to function properly. A full keypair must be present in order to change the `yaml` files' values, and to update their keys.

## Roadmap

My setup is a living system configuration, and will be frequently updated as I make modifications. As such, I have the following general additions, fixes, and improvements on my radar.

### Beautification

- [ ] Declarative wallpaper with wpaperd
- [ ] Mako customization
- [ ] Waybar styling (the standard rectangles are godawful)
- [ ] Swaylock with an actual background instead of blinding white

### Gaming

- [x] Genshin Impact: uses Lutris & WINE
- [ ] Steam in general

## Caveats

My FoundryVTT setup uses my own fork of reckenrode's [nix-foundryvtt](https://github.com/reckenrode/nix-foundryvtt) flake. This is because, as of my initial setup and configuration, the FVTT 13.350 PR was still pending a merge. I will likely _continue_ to use my own fork, and cherry-pick new builds on the bleeding edge, to support my work with [The Metalworks](https://github.com/the-metalworks).
