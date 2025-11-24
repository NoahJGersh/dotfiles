{ config, ... }:
{
  services.mako.enable = true;
  services.mako.settings  = {
    font = "${config.fontProfiles.regular.name} ${toString config.fontProfiles.regular.size}";
    "app-name=Spotify" = {
      invisible = true;
    };
  };
}
