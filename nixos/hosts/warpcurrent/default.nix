{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    # Global setup
    ../common/global
    ../common/users/kolastor

    # Warpcurrent-specific secrets
    ./secrets

    ../common/optional/foundryvtt.nix
  ];

  networking.hostName = "warpcurrent";
  
  # VPN interfaces
  networking.wg-quick.interfaces = {
    protonVPN_fast = {
      autostart = true;
      address = [
        "10.2.0.2/32"
      ];
      dns = [
        "10.2.0.1"
      ];
      peers = [
        {
          allowedIPs = [
            "0.0.0.0/0"
            "::/0"
          ];
          endpoint = "79.127.185.166:51820";
          publicKey = "2xvxhMK0AalXOMq6Dh0QMVJ0Cl3WQTmWT5tdeb8SpR0=";
        }
      ];
      privateKeyFile = config.sops.secrets.protonvpn-us-ca-private-key.path;
    };
    protonVPN_uk = {
      autostart = false;
      address = [
        "10.2.0.2/32"
      ];
      dns = [
        "10.2.0.1"
      ];
      peers = [
        {
          allowedIPs = [
            "0.0.0.0/0"
            "::/0"
          ];
          endpoint = "146.70.133.130:51820";
          publicKey = "SrT34F0BbJq2U7v8/1V1MRFUMnn7YixbhWUN01xnF2Q=";
        }
      ];
      privateKeyFile = config.sops.secrets.protonvpn-uk-private-key.path;
    };
  };

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxPackages_latest;
  };

  environment.variables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICIATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  nix.settings.trusted-users = [ "root" "kolastor" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = {};

  environment.systemPackages = with pkgs; [
    # Terminal
    ghostty

    # Boilerplate CLI utils
    git
    curl
    wget
    powerline
 
    # VSCodium config
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        rust-lang.rust-analyzer
      ];
    })

    # Web Dev
    nodejs_24 # Next
    nodejs_22 # LTS
    nodejs_20 # Deprecated (for compat)
    nodenv
    pnpm

    # Rust
    cargo
    rustc

    # Other languages/toolchains
    go
    gcc
    python314

    # Communication
    protonmail-desktop
    zoom-us
    discord

    # Media
    ffmpeg
    spotify
    playerctl

    # Nix utils
    cachix

    # Desktop env utils
    waybar
    fuzzel
    swaylock
    mako
    swayidle
    wpaperd
    nautilus
    pavucontrol

    # Extra display stuff
    xwayland-satellite
  ];

  # Fonts
  fonts.packages = with pkgs; [ font-awesome ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  services.logrotate.checkConfig = false;

  system.stateVersion = "25.05";
}
