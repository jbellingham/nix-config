{ config, ... }:
{
  imports = [
    ./direnv.nix
    ./zsh.nix
  ];

home-manager.users."jesse" = {
    programs.mcfly = {
      enable = true;
      fzf.enable = true;
    };

    programs.oh-my-posh = {
      enable = true;
      useTheme = "1_shell";
    };

    programs.vim.enable = true;


    programs.autojump = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}