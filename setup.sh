#!/bin/bash

# curl -s https://raw.githubusercontent.com/whattheearl/dotfiles/main/setup.sh | bash

sudo pacman -S git make --noconfirm
git clone https://github.com/whattheearl/dotfiles /tmp/dotfiles
cd /tmp/dotfiles

[[ $HOST -eq "ws" ]] && \
    nmcli connection modify Wired\ connection\ 1 ipv4.dns "10.0.0.1" && \
    nmcli connection show Wired\ connection\ 1 | grep ipv4.dns:
make packages

source ~/.nvm/nvm.sh && nvm install --lts && nvm use --lts
sudo usermod -aG docker ${USER} && sudo newgrp docker
[[ $HOST -eq "ws" ]] && sudo systemctl enable --now docker
[[ $HOST -eq "ws" ]] && sudo ln -s /usr/bin/fusermount3 /usr/bin/fusermount || true
[[ $HOST -eq "ws" ]] && make packages-flatpaks
make secrets
make repos
make symlinks
# make restore
