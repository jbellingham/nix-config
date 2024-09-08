{ ...}: {
  imports = [
    ../common/gui-apps
    ./gnome.nix
    ./flatpaks.nix
    ./aliases.nix
  ];
}