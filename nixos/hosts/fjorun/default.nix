{ config, pkgs, inputs, lib, ...}:
{
  imports = [
    ./hardware-configuration.nix

    # Global setup
    ../common/global
    ../common/users/kolastor
  ];

  networking.hostName = "fjorun";

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
    LC_IDENTIFICATION = "en_US.UTF-8";
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
    yarn

    # Rust
    cargo
    rustc

    # Other languages/toolchains
    go
    gcc
    python314

    # Communication
    discord
    zoom-us

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
