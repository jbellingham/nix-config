# System config for NixOS

{ inputs, globals, home-manager, ... }:
with inputs;

home-manager.lib.homeManagerConfiguration {
  system = "x86_64-linux";

  modules = [
    globals
    nix-flatpak.nixosModules.nix-flatpak
    home-manager.nixosModules.home-manager
    ../../modules/nix
    ../../modules/common
    {
      imports = [
        ../../modules/home.nix
      ];

      users.user = {
        enable = true;
        name = "jesse";
      };
    }
  ];
}
