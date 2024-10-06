{ inputs, ... }:
with inputs;
darwin.lib.darwinSystem {
  system = "x86_64-linux";
  modules = [
    # home manager
    home-manager.darwinModules.home-manager
    ./configuration.nix
    ../../modules/common
    ../../modules/wsl
    {
      imports = [
        ../../modules/home.nix
      ];

      users.user = {
        enable = true;
        name = "jesse";
      };

      home-manager.users.jesse = {
        home.stateVersion = "24.05";
      };
    }
  ];
}
