#! /bin/sh
set -euxo pipefail

mkdir -p ~/.local/share/backgrounds
cp ~/nixos-config/alex-knight-Ys-DBJeX0nE-unsplash.jpg ~/.local/share/backgrounds

sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.bak
sudo mv ~/nixos-config/hosts/nixos/hardware-configuration.nix ~/nixos-config/hosts/nixos/hardware-configuration.bak
sudo mv /etc/nixos/hardware-configuration.nix ~/nixos-config/hosts/nixos
sudo ln -sf ~/nixos-config/* /etc/nixos

sudo nixos-rebuild switch
# chsh -s $(which zsh)