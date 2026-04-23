#!/bin/sh

# https://raw.githubusercontent.com/whattheearl/dotfiles/master/asahisetup.sh

source ./utils.sh

echo 'install packages...'
sudo dnf install -y \
	alacritty \
	age \
	brightnessctl \
	chromium \
	docker-cli \
	docker-compose \
	fd \
	fira-code-fonts \
	fzf \
	git \
	htop \
	lazygit \
	librewolf \
	luarocks \
	make \
	nvim \
	rbw \
	sddm \
	sqlite3 \
	sway \
	tldr \
	vim-X11 \
	zsh

echo 'create secrets...'
createSecrets

echo 'symlink dotfiles...'
symlinkDotfiles
ln -sf "${PWD}/alacritty/alacritty.asahi.toml" "${HOME}/.config/alacritty/alacritty.toml"

echo 'clone repos...'
cloneRepos

echo 'change shell...'
changeShell
