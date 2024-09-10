{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    # https://search.nixos.org/packages
    # ---
    # cli tools
    # ---
    ant
    awscli2
    btop
    gh
    git
    git-extras
    jump
    jq
    nodePackages."npm-check-updates"
    nixfmt-rfc-style
    shellcheck
    tldr

    # fonts
    meslo-lg
    meslo-lgs-nf
    source-code-pro
  ];
}
