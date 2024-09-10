{ config, ... }:
{
  home-manager.users.${config.users.user.name}.programs.git = {
    enable = true;
    ignores = [ ".direnv" ];
    includes = [
      { path = "~/nixos-config/modules/common/git/.gitconfig"; }
    ];
  };
}
