{ ... }: {
  home-manager.users."jesse".programs.git = {
    enable = true;
    includes = [
      { path = "~/.config/home-manager/modules/git/.gitconfig"; }
    ];
  };
}