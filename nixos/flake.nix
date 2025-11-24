{
  description = "NixOS Configuration for my machines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    systems.url = "github:nix-systems/default-linux";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    foundryvtt = {
      url = "github:NoahJGersh/nix-foundryvtt?ref=13.351";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    niri,
    systems,
    ...
  } @ inputs: let
    inherit (self) outputs;
    pkgsFor = nixpkgs.lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );
  in {
    nixosConfigurations = {

      # Home PC 
      fjorun = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [ 
          ./hosts/fjorun
        ];
      };

      # Laptop (LG Gram)
      warpcurrent = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/warpcurrent
        ];
      };

    };
    
    homeConfigurations = {
    
      "kolastor@fjorun" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./home/kolastor/fjorun.nix
        ];
      };

    #   "kolastor@warpcurrent" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = pkgsFor.x86_64-linux;
    #     extraSpecialArgs = { inherit inputs outputs; };
    #     modules = [ ./home/kolastor/warpcurrent.nix ./home/kolastor/nixpkgs.nix ];
    #   };

    };
  };
}
