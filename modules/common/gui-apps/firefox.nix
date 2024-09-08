{ config, ... }: {
  home-manager.users.${config.users.user.name} = {
    programs.firefox = {
      enable = true;
    };
  };
}