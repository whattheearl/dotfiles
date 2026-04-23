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
	# neovim \
	rbw \
	sddm \
	sqlite3 \
	sway \
	tldr \
	vim-X11 \
	zsh

# temp build from source
git clone --branch v0.12.2 https://github.com/neovim/neovim $HOME/oss/neovim
cd $HOME/oss/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
sha256sum $HOME/oss/neovim/build/bin/nvim
echo "7ad904f4710c3c0ef936f65d727fa746b235a66927ddb86e498953d20dba5f0f /usr/local/bin/nvim"

echo 'create secrets...'
createSecrets

echo 'symlink dotfiles...'
symlinkDotfiles
ln -sf "${PWD}/alacritty/alacritty.asahi.toml" "${HOME}/.config/alacritty/alacritty.toml"

echo 'clone repos...'
cloneRepos

echo 'change shell...'
changeShell
