{ ... }: {
  home-manager.users."jesse".programs.git = {
    enable = true;
    ignores = [ ".direnv" ];
    includes = [
      { path = "~/nixos-config/modules/common/git/.gitconfig"; }
    ];
  };
}