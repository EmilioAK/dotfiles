{
  description = "Emilio's Darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    local = import ./local.nix;
    inherit (local) hostname username system;

    configuration = nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit username hostname; };
      modules = [
        ./system.nix
        ./homebrew.nix
        { networking.hostName = hostname; }
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = { inherit username hostname; };
          home-manager.users.${username} = import ./home.nix;
        }
      ];
    };
  in {
    darwinConfigurations.${hostname} = configuration;
    darwinConfigurations.default = configuration;
  };
}
