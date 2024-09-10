{ ... }:
{
  imports = [
    ./aliases.nix
    ../common/gui-apps
    ./gnome.nix
    ./flatpaks.nix
  ];
}
