{ config, ... }:
{
    home-manager.users.${config.users.user.name}.programs.direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
    };
}