{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      userSettings = {
        "dotnetAcquisitionExtension.sharedExistingDotnetPath" = "${pkgs.dotnet-sdk_9}/bin";
        "godotTools.lsp.serverPort" = 6005;
      };
      extensions = with pkgs.vscode-extensions; [
        # CSharp / Godot
        geequlim.godot-tools
        ms-dotnettools.csharp
        ms-dotnettools.vscode-dotnet-runtime
      ];
    };
  };

  home.packages = [
      dotnetCorePackages.dotnet_9.sdk
  ];
}
