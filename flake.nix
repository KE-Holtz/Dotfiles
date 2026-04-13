{
  description = "My main configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    frc-nix = {
      url = "github:frc4451/frc-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, disko, home-manager, stylix, ... }: 
  let
    system = "x86_64-linux";
  in 
  {
    nixosConfigurations.framework = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs;
      };

      modules = [
        disko.nixosModules.disko
	stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.kyle = import home/home.nix;
          nixpkgs.overlays = [ inputs.frc-nix.overlays.default ];
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };
	}
        ./configuration.nix
      ];
    };

    homeConfigurations.kyle = home-manager.lib.homeManagerConfiguration {
      inherit system;
      modules = [ ./home.nix ];
      username = "kyle";
      homeDirectory = "/home/kyle";
    };
  };
}

