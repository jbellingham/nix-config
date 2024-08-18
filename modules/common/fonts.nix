{ pkgs, ... }: {
  home-manager.users."jesse".home = with pkgs; {
    packages = [
      fira-code
      hack-font
      meslo-lgs-nf
      monaspace
    ];
  };
}