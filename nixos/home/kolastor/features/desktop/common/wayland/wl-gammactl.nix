{ config, pkgs, fetchFromGitHub, ... }:
{
  home.packages = with pkgs; [
    (wl-gammactl.overrideAttrs (final: prev: {
      src = fetchFromGitHub {
        owner = "mistgc";
        repo = "wl-gammactl";
        rev = "a796f55d81c558f1e4bde4a713c3f171b9005624";
        sha256 = "12bl69wy2val18znjax87jdzw36acprfp5mwffwg6vhvjzb0g6r9";
      };
    }))
  ];
}
