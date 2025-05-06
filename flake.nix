{
  description = "One flake to rule them all";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Lebih eksplisit
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
    { self, nixpkgs, ... }@inputs:
    let
      username = "abdyllaan";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations.abdyllaan = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [ ./configuration.nix ];
        specialArgs = {
          host = "killua";
          inherit self inputs username;
        };
        # modules = [
        #   ./configuration.nix
        #
        #   # Integrasi Home Manager sebagai module NixOS
        #   home-manager.nixosModules.home-manager
        #
        #   # Konfigurasi spesifik untuk Home Manager
        #   {
        #     home-manager.useGlobalPkgs = true;
        #     home-manager.useUserPackages = true;
        #     home-manager.users.abdyllaan = import ./home.nix;
        #
        #     # Kirim semua inputs ke konfigurasi agar bisa digunakan di home.nix
        #     _module.args.inputs = inputs;
        #   }
        # ];
        # specialArgs = {
        #   host = "killua";
        #   inherit self inputs username;
        # };
      };
    };
}
