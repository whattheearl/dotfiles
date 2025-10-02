#!/bin/bash

# curl -s https://raw.githubusercontent.com/whattheearl/dotfiles/main/setup.sh | bash

sudo pacman -S git
git clone https://github.com/whattheearl/dotfiles /tmp/dotfiles
cd /tmp/dotfiles
sleep 3

nmcli connection modify Wired\ connection\ 1 ipv4.dns "10.0.0.1"
nmcli connection show Wired\ connection\ 1 | grep ipv4.dns:
sleep 3

make packages-arch
sleep 3
make secrets
sleep 3
make repos
sleep 3
make symlinks
sleep 3
# make restore

sudo usermod -aG docker $USER && newgrp docker && sudo systemctl enable --now docker
nvm install --lts
nvm use --lts
sleep 3
