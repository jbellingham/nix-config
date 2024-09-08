{ inputs, ... }: with inputs;
darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
        ./configuration.nix
        ../../modules/common
        ../../modules/home/user.nix
        ../../modules/darwin
        # home manager
        home-manager.darwinModules.home-manager
        {
          imports = [
            ../../modules/home.nix
          ];

          users.user.name = "jessebellingham";
        }
      ];
}
  