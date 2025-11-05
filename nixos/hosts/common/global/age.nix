{ inputs, config, ... }:
{
  imports = [ inputs.agenix.nixosModules.default ];

  age.secrets = import ../secrets;

  age.identityPaths = [ "/var/lib/persistent/id_ed25519" ];
}
