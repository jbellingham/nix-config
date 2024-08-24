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
    ../../modules/common
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = ".bak";

      home-manager.users.jesse = import ../../home.nix;
    }
  ];
}