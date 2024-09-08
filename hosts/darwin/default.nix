{ inputs, ... }: with inputs;
darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
        # home manager
        home-manager.darwinModules.home-manager
        ./configuration.nix
        ../../modules/common
        ../../modules/darwin
        {
          imports = [
            ../../modules/home.nix
          ];

          users.user = {
            enable = true;
            name = "jessebellingham";
          };
        }
    ];
}