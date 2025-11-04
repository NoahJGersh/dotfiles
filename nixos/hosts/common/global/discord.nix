{ config, pkgs, inputs, ... }:
let
  inherit ((inputs.nix-webapps.overlays.default pkgs pkgs).nix-webapp-lib) mkFirefoxApp;
  discord = (mkFirefoxApp {
    name = "discord";
    url = "https://discord.com/app";
    prefs = {
      "extensions.htmlaboutaddons.recommendations.enabled" = false;
    };
    extensions = with pkgs; [ nur.repos.rycee.firefox-addons.ublock-origin ];
    makeDesktopItemArgs = {
      comment = "All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone.";
      genericName = "Internet Messenger";
      categories = [
        "Network"
        "InstantMessaging"
      ];
    };
  });
in
{
  imports = [ inputs.nur.modules.nixos.default ];

  environment.systemPackages = [ discord ];
}
