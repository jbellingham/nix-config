{ config, pkgs, ... }:
{
  home-manager.users.${config.users.user.name}.programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    extensions =
      with pkgs.vscode-extensions;
      [
        eamodio.gitlens
        jnoortheen.nix-ide
        ms-vscode.makefile-tools
        wakatime.vscode-wakatime
        ms-vscode.makefile-tools
        arrterian.nix-env-selector
        # kisstkondoros.vscode-codemetrics
        # dbaeumer.vscode-eslint
        vincaslt.highlight-matching-tag
        christian-kohler.npm-intellisense
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "codeium";
        publisher = "codeium";
        version = "1.21.1";
        sha256 = "00xvqigqn3fwwxi95vcvy0pf69x6kb8jdvs6r7gn7k2jig88ahhz";
      }
      ];
  };
}
