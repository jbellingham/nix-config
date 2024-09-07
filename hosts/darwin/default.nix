{ inputs, ... }: with inputs;
  darwin.lib.darwinSystem {
    modules = [
        configuration
        ./configuration.nix
        ../../modules/darwin

        # home manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = ".bak";

          home-manager.users.jesse = import ../../home.nix;
        }
      ];
  }