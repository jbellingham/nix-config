{ ... }: {
  home-manager.users."jessebellingham" = {
    programs.firefox = {
      enable = true;
    };
  };
}