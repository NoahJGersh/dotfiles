# My Dotfiles

This repo contains all of my NixOS system/user configuration.

Notably, my flake-based configuration follows the general patterning and principles of [Misterio77's nix-config](https://github.com/Misterio77/nix-config), with some adjustments for alternate secret management (I'm using [agenix](https://github.com/ryantm/agenix), and dynamically checking for SSH keys as I add new users and/or systems). My setup is also much more pared down, and currently only properly built for my laptop.

## Roadmap

My setup is a living system configuration, and will be frequently updated as I make modifications. As such, I have the following general additions, fixes, and improvements on my radar.

### Home Manager Migration

Though the initial basis for my configuration was largely slapped together based on what I had already set up for Warpcurrent, I plan on migrating to use Home Manager modules for some more user-centric configuration.

### Exposing Other Configs

Some of the packages I used, such as ghostty and niri, have custom configurations set up. Currently, I am not mirroring them to the repository. That will change as I continue to make modifications to them.

- [ ] niri
- [ ] ghostty
- [ ] mako (not actually customized yet)
- [ ] waybar (not actually customized yet)

### Discord

My Discord setup uses a wrapped build of Firefox, a la [nix-webapps](https://github.com/TLater/nix-webapps?ref=tlater/idiomatic-flake). For whatever reason, Discord hates my VPN and the official client (nor alternate clients that I've tried to use) load properly while I'm connected. It works in Firefox, so I have an app-ified version of that.

There are some notable issues with the setup:

- [ ] RTC Disconnect, intermittent issues. Likely caused by my VPN configuration.
- [ ] Wayland screenshare audio. Discord will stream the screen, but unfortunately without audio.

### VS Code/ium

As I continue bringing my workflow back up to speed with the kinds of development work I tend to do, I'll be adding more extensions.

That said, for most simple workflows, I've just been falling back to vim anyways.

### Gaming

Video games. I would _love_ to configure some declarative, rather than imperative, game installations. I'll try to leverage steamcmd where I can, but I'll fall back to imperative installations where that fails. In general, the main points of interest are as follows:

- [ ] General Steam + Heroic launcher setup. This might pend desktop setup, because my laptop hardware can only run a few of the games I actively play.
- [ ] Genshin Impact, likely through Heroic. Playing on mobile is fine, playing on a computer is preferable.
- [ ] Minecraft, especially with modpacks.

### VPN Updates

- [ ] DNS...
- [ ] Additional ProtonVPN profiles
  - [ ] Secure Core
  - [ ] UK Endpoint

## Caveats

My FoundryVTT setup uses my own fork of reckenrode's [nix-foundryvtt](https://github.com/reckenrode/nix-foundryvtt) flake. This is because, as of my initial setup and configuration, the FVTT 13.350 PR was still pending a merge. I will likely _continue_ to use my own fork, and cherry-pick new builds on the bleeding edge, to support my work with [The Metalworks](https://github.com/the-metalworks).
