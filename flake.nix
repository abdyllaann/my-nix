# {
#   description = "One flake to rule them all";
#
#   inputs = {
#     nixpkgs-stable.url = "nixpkgs/nixos-24.05"; # Versi stabil
#     nixpkgs-unstable.url = "nixpkgs/nixos-unstable"; # Versi bleeding-edge
#
#     home-manager.url = "github:nix-community/home-manager/master";
#     home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable"; # Ikuti unstable
#   };
#
#   outputs = { self, nixpkgs-stable, nixpkgs-unstable, home-manager, ... }:
#     let
#       system = "x86_64-linux";
#       pkgs = nixpkgs-unstable.legacyPackages.${system};
#     in
#     {
#       nixosConfigurations = {
#         abdyllaan = nixpkgs-unstable.lib.nixosSystem {
#           inherit system;
#           modules = [ ./configuration.nix ];
#         };
#       };
#
#       homeConfigurations = {
#         abdyllaan = home-manager.lib.homeManagerConfiguration {
#           inherit pkgs;
#           modules = [
#             ./home.nix
#           ];
#         };
#       };
#     };
# }




{
  description = "FrostPhoenix's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    nix-gaming.url = "github:fufexan/nix-gaming";

    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };

    zig.url = "github:mitchellh/zig-overlay";

    nvf.url = "github:notashelf/nvf";
  };

  outputs =
    { nixpkgs, self, home-manager, ... }@inputs:
    let
      username = "frostphoenix";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        abdyllaan = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
          specialArgs = {
            host = "abdyllaan";
            inherit self inputs username;
          };
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




