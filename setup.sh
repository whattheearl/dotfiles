#!/bin/bash
# curl -s https://raw.githubusercontent.com/whattheearl/dotfiles/master/setup.sh | bash

set -e
HOSTNAME=$(hostnamectl hostname)

echo "${HOSTNAME} setup"
if [[ "$HOSTNAME" == "ws" ]]; then
    sudo pacman -S base-devel --noconfirm;
elif [[ "$HOSTNAME" == "asahi" ]]; then
    sudo dnf install make git -y;
fi

git clone https://github.com/whattheearl/dotfiles ${HOME}/wte/dotfiles || true
cd ${HOME}/wte/dotfiles

make all

# setup nvm
source ~/.nvm/nvm.sh && \
    nvm install --lts && 
    nvm use --lts

# setup docker
sudo usermod -aG docker ${USER} && \
    newgrp docker && \
    sudo systemctl enable --now docker

# setup dns
if [[ "$HOSTNAME" == "ws" ]]; then
    nmcli connection modify Wired\ connection\ 1 ipv4.dns "10.0.0.1"
    nmcli connection show Wired\ connection\ 1 | grep ipv4.dns:
fi

# setup zsh
sudo chsh -s /usr/bin/zsh

echo 'COMPLETE'
