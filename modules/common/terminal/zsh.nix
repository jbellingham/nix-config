{ config, pkgs, ... }: {
    # Ensure zsh is installed and enabled as the default shell
    # command -v zsh | sudo tee -a /etc/shells
    # chsh -s $(which zsh)

    programs.zsh.enable = true;
    users.users.${config.users.user.name}.shell = pkgs.zsh;

    home-manager.users.${config.users.user.name} = {
        programs.zsh = {
            enable = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;
            autocd = true;

            shellAliases = {
                # docker
                dlist = "docker ps -a && docker images";
                dps = "docker ps";
                dcb = "docker-compose build";
                dcu = "docker-compose up";
                dcd = "docker-compose down";

                # kubernetes
                k = "kubectl";
                kns = "kubens";

                # dotnet
                drunp = "dotnet run --project";

                cat = "bat";
                top = "btop";

                #   vim="lvim -S Session.vim";
                vim = "vim -S Session.vim";
                grep = "grep -iF --color=auto";
                tmuxa = "tmux attach";
                dockerdebug = "docker run -ti --entrypoint sh";
                ll = "ls -latr";
            };

            plugins = [
            {
                name = "fzf-tab";
                src = pkgs.fetchFromGitHub {
                    owner = "Aloxaf";
                    repo = "fzf-tab";
                    rev = "v1.1.2";
                    sha256 = "Qv8zAiMtrr67CbLRrFjGaPzFZcOiMVEFLg1Z+N6VMhg=";
                };
            }];
        };
    };
}