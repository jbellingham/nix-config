{ config, ... }:
{
    home-manager.users."jesse".programs.direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
    };
    
}