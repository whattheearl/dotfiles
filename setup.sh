#!/bin/bash
sudo pacman -S git
git clone https://github.com/whattheearl/dotfiles /tmp/dotfiles
cd /tmp/dotfiles
make packages-arch
make secrets
make repos
make restore
make symlinks

