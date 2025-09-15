#!/bin/bash
# curl -s https://raw.githubusercontent.com/whattheearl/dotfiles/main/setup.sh | bash

sudo pacman -S git
git clone https://github.com/whattheearl/dotfiles /tmp/dotfiles
cd /tmp/dotfiles
make packages-arch
make secrets
make repos
make restore
make symlinks
sudo usermod -aG docker $USER && newgrp docker && sudo systemctl enable --now docker
