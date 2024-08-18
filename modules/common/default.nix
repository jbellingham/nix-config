{ ...}: {
  imports = [
    ./applications/vscode.nix
    ./fonts.nix
    ./terminal
    ./git
  ];
}