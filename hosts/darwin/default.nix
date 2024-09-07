{ inputs, ... }: with inputs;
darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    
    modules = [
        ./configuration.nix
        ../../modules/darwin
        # home manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = ".bak";

          users.users.jessebellingham = {
            home = "/Users/jessebellingham";
            name = "jessebellingham";
          };

          home-manager.users.jessebellingham = import ../../home.nix;
        }
      ];
}
  