{
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./sops.nix
    ./audio.nix
    ./bluetooth.nix
    ./display-manager.nix
    ./firefox.nix
    ./networkmanager.nix
    ./niri.nix
    ./openssh.nix
    ./vim.nix
  ];

  # home-manager.useGlobalPkgs = true;
  # home-manager.extraSpecialArgs = {
  #   inherit inputs outputs;
  # };

  nixpkgs = {
  #  overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  hardware.enableRedistributableFirmware = true;

  security.pam.loginLimits = [
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];

  services.speechd.enable = false;
}
