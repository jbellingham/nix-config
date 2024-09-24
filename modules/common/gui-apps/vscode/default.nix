{ config, pkgs, ... }:
{
  home-manager.users.${config.users.user.name}.programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    extensions =
      pkgs.vscode-utils.extensionsFromVscodeMarketplace (import ./extensions.nix).extensions;
  };
}
