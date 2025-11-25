{ config, ... }:
{
  services.mako.enable = true;
  services.mako.settings  = {
    # font = "${config.fontProfiles.regular.name} ${toString config.fontProfiles.regular.size}";
    font = "FiraCode Nerd Font 10";
    "app-name=Spotify" = {
      invisible = true;
    };
  };
}
