.PHONY: help packages symlinks secrets
SHELL := /bin/bash

## help: print this help message
help:
	@echo 'Usage:'
	@echo ${MAKEFILE_LIST}
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## symlinks: symlink apps to ${HOME}/.config
symlinks:
	ln -sf ${PWD}/nvim ${HOME}/.config
	ln -sf ${PWD}/wezterm ${HOME}/.config
	ln -sf ${PWD}/tmux ${HOME}/.config
	ln -sf ${PWD}/zsh/zshrc ${HOME}/.zshrc
	ln -sf ${PWD}/i3 ${HOME}/.config
	ln -sf ${PWD}/wofi ${HOME}/.config
	ln -sf ${PWD}/eslint ${HOME}/.config
	ln -sf ${PWD}/prettier ${HOME}/.config
	ln -sf ${PWD}/aerospace ${HOME}/.config

## packages: installs arch packages
packages:
	command -v yay &> /dev/null || \
		sudo pacman -S --needed git base-devel \
		git clone https://aur.archlinux.org/yay.git ${HOME}/apps/yay \
		cd ${HOME}/apps/yay \
		makepkg -si
	yay --noconfirm --needed -S \
		aspnet-runtime-8.0 \
		base-devel \
		bind-tools \
		bitwarden \
		bluez \
		bluez-utils \
		docker \
		docker-buildx \
		docker-compose \
		dotnet-sdk-8.0 \
		fd \
		firefox \
		flameshot \
		flatpak \
		fuse3 \
		fzf \
		gcc \
		git \
		jq \
		lazygit-git \
		lua \
		make \
		man \
		mariadb \
		neovim \
		nvm \
		oh-my-zsh-git \
		postgresql \
		restic \
		ripgrep \
		steam \
		tldr \
		ttf-firacode-nerd \
		unzip \
		visual-studio-code-bin \
		wezterm \
		xclip \
		xorg-xinput \
		xorg-xrandr \
		zsh \
		zsh-autosuggestions \
		zsh-history-substring-search \
		zsh-syntax-highlighting \
		zsh-theme-powerlevel10k-git
	sudo ln -s /usr/bin/fusermount3 /usr/bin/fusermount
	flatpak install com.usebottles.bottles
	flatpak install com.discordapp.Discord

## secrets: adds ssh, envvars keys
secrets:
	mkdir -p ${HOME}/.ssh
	bw get item 84174bac-6c19-4711-9af9-b27f0176f102 | jq -r ".sshKey.privateKey" > ${HOME}/.ssh/id_ed25519
	bw get item 84174bac-6c19-4711-9af9-b27f0176f102 | jq -r ".sshKey.publicKey" > ${HOME}/.ssh/id_ed25519.pub
	chmod 400 ${HOME}/.ssh/id_ed25519
	bw get item bcac7ee2-d117-4341-a81a-b2380125a710 | jq -r ".notes" > ${HOME}/wte/dotfiles/zsh/secrets.sh

## packages-brew: adds brew packages for air
packages-brew:
	brew install \
		dotnet \
		fd \
		fzf \
		tldr 

## packages-npm: installs eslint, prettier
packages-npm:
	@cd ${HOME}/.config/eslint && npm i eslint@9 \
		@eslint/js@9 \
		@stylistic/eslint-plugin-js@4 \
		@stylistic/eslint-plugin-ts@4 \
		typescript-eslint@8
	@npm i -g prettier@3 \
		prettier-plugin-svelte@3 \
		prettier-plugin-tailwindcss@0

