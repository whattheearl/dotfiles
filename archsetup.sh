#!/bin/sh

# https://raw.githubusercontent.com/whattheearl/dotfiles/master/archsetup.sh

source ./utils.sh

echo 'installing packages...'
command -v yay > /dev/null 2>&1 ||
	(sudo pacman -S --needed --noconfirm base-devel &&
	git clone https://aur.archlinux.org/yay.git ~/oss/yay &&
	cd ~/oss/yay &&
	makepkg -si)

yay --noconfirm --needed -S \
	age \
	alacritty \
	bluez \
	bluez-utils \
	bun \
	docker \
	docker-buildx \
	docker-compose \
	fd \
	feh \
	flameshot \
	fzf \
	gcc \
	htop \
	jq \
	lazygit \
	librewolf-bin \
	llama.cpp-vulkan \
	man \
	mpv \
	neovim \
	nvm \
	rbw \
	ripgrep \
	rsync \
	spotify \
	sqlite \
	steam \
	tldr \
	ttf-firacode-nerd \
	typescript-language-server \
	xclip \
	xorg-xinput \
	xorg-xrandr \
	xorg-xset \
	ytdl

echo 'create secrets...'
createSecrets

echo 'symlink dotfiles...'
symlinkDotfiles
ln -sf "${PWD}/alacritty/alacritty.ws.toml" "${HOME}/.config/alacritty/alacritty.toml"

echo 'config network...'
nmcli connection modify Wired\ connection\ 1 ipv4.dns "10.0.0.1"
nmcli connection show Wired\ connection\ 1 | grep ipv4.dns:

echo 'clone repos...'
cloneRepos

echo 'change shell...'
changeShell
