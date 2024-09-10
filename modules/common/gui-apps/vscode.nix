{ config, pkgs, ... }:
{
  home-manager.users.${config.users.user.name}.programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions =
      with pkgs.vscode-extensions;
      [
        eamodio.gitlens
        jnoortheen.nix-ide
        ms-vscode.makefile-tools
        shopify.ruby-lsp
        wakatime.vscode-wakatime
        ms-vscode.makefile-tools
        arrterian.nix-env-selector
        github.copilot
        # kisstkondoros.vscode-codemetrics
        dbaeumer.vscode-eslint
        github.copilot-chat
        vincaslt.highlight-matching-tag
        wix.vscode-import-cost
        christian-kohler.npm-intellisense
        # pnp.polacode
        mechatroner.rainbow-csv
        redhat.vscode-yaml
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "codeium";
          publisher = "codeium";
          version = "1.15.15";
          sha256 = "1qq2nkd1r6qq4m1l69hdj09mq7p0pblnqg9p11xagjawlvcyhp3b";
        }
      ];
    userSettings = {
      "editor.fontSize" = 16;
      "editor.cursorStyle" = "line";
      "terminal.integrated.fontSize" = 16;
      "editor.renderWhitespace" = "all";
      "debug.console.fontFamily" = "'Monaspace Argon', monospace";
      "terminal.integrated.fontFamily" = "MesloLGS NF";
      "editor.fontFamily" = "'Monaspace Argon', monospace";
      "git.autofetch" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nixd.options.enable" = true;
      "editor.formatOnSave" = true;
      "codeium.enableConfig" = {
        "*" = true;
        "nix" = true;
        "erb" = true;
      };
    };
  };
}
