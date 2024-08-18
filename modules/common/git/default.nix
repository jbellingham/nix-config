{ ... }: {
  home-manager.users."jesse".programs.git = {
    enable = true;
    includes = [
      { path = "~/nixos-config/modules/common/git/.gitconfig"; }
    ];
  };
}