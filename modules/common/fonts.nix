{ config, pkgs, ... }:
{
  home-manager.users.${config.users.user.name}.home = with pkgs; {
    packages = [
      fira-code
      hack-font
      meslo-lgs-nf
      monaspace
    ];
  };
}
