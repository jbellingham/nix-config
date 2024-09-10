{ config, pkgs, ... }:
{
  imports = [
    ./direnv.nix
    ./zsh
  ];

home-manager.users.${config.users.user.name} = {
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

    programs.bat = {
      enable = true;
      config = {
        theme = "Dracula";
        pager = "less -FR";
      };
      themes = {
        dracula = {
          src = pkgs.fetchFromGitHub {
            owner = "dracula";
            repo = "sublime"; # Bat uses sublime syntax for its themes
            rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
            sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
          };
          file = "Dracula.tmTheme";
        };
      };
    };
  };
}