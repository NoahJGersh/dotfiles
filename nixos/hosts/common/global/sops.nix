{ config, inputs, ...}:
{
  imports = [ 
    inputs.sops-nix.nixosModules.sops
    ../secrets
  ];

  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
}
