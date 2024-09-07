{ ... }: {
  home-manager.users."jesse" = {
    programs.firefox = {
      enable = true;
    };
  };
}