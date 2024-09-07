{ ... }: {
  home-manager.users."jessebellingham".programs.git = {
    enable = true;
    ignores = [ ".direnv" ];
    includes = [
      { path = "~/nixos-config/modules/common/git/.gitconfig"; }
    ];
  };
}