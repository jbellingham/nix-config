# System config for NixOS

{ inputs, globals, ... }:
with inputs;

nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";

  modules = [
    globals
    nix-flatpak.nixosModules.nix-flatpak
    home-manager.nixosModules.home-manager
    ./configuration.nix
    ./hardware-configuration.nix
    ../../modules/nix
    ../../modules/common
    {
      imports = [
        ../../modules/home.nix
      ];
    }
  ];
}