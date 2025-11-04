{ inputs, config, ... }:
{
  imports = [ inputs.agenix.nixosModules.default ];

  age.secrets = import ../secrets;
}
