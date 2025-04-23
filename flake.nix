{
  description = "One flake to rule them all";

  inputs = {
    nixpkgs-stable.url = "nixpkgs/nixos-24.05"; # Versi stabil
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable"; # Versi bleeding-edge

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable"; # Ikuti unstable
  };

  outputs = { self, nixpkgs-stable, nixpkgs-unstable, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        abdyllaan = nixpkgs-unstable.lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
        };
      };

      homeConfigurations = {
        abdyllaan = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
          ];
        };
      };
    };
}



