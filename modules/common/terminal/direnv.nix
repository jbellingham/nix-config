{ config, ... }:
{
    home-manager.users."jessebellingham".programs.direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
    };
    
}