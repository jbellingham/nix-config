#! bin/env bash
set -euxo pipefail

mkdir ~/.background-image
cp ./alex-knight-Ys-DBJeX0nE-unsplash.jpg ~/.background-image

sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.bak
sudo mv ~/nixos-config/hosts/nixos/hardware-configuration ~/nixos-config/hosts/nixos/hardware-configuration.bak
sudo ln -s ~/nixos-config/* /etc/nixos

sudo nixos-rebuild switch
# chsh -s $(which zsh)