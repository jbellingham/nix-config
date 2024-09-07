{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, ... }@inputs: 
    let
      # Global configuration for my systems
      globals =
        rec {
            # user = "jesse";
            # fullName = fullName;
            # gitName = fullName;
            # gitEmail = "5078290+jbellingham@users.noreply.github.com";
          };

      # System types to support.
      supportedSystems =
        [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    in rec {
    nixosConfigurations = {
      nixos = import ./hosts/nixos { inherit inputs globals; };
    };

    darwinConfigurations."Jesses-MacBook-Pro" = import ./hosts/darwin/default.nix { inherit inputs globals; };
    darwinPackages = self.darwinConfigurations."Jesses-MacBook-Pro".pkgs;
  };
}