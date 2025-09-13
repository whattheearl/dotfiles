#!/usr/env/bin bash
git clone git@github.com/whattheearl/dotfiles /tmp
cd /tmp/dotfiles
make packages-arch
make secrets
make repos
make restore
make symlinks

