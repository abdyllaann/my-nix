{
  description = "One flake to rule them all";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Lebih eksplisit
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.abdyllaan = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix

          # Integrasi Home Manager sebagai module NixOS
          home-manager.nixosModules.home-manager

          # Konfigurasi spesifik untuk Home Manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.abdyllaan = import ./home.nix;

            # Kirim semua inputs ke konfigurasi agar bisa digunakan di home.nix
            _module.args.inputs = inputs;
          }
        ];
      };
    };
}
