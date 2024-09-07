{ pkgs, ... }: {

environment.systemPackages = with pkgs;
    [
        # https://search.nixos.org/packages
        # ---
        # cli tools
        # ---
        ant
        awscli2
        bat
        btop
        gh
        git
        git-extras
        jq
        nodePackages."npm-check-updates"
        shellcheck
        tldr

        # fonts
        meslo-lg
        meslo-lgs-nf
        source-code-pro
    ];
}