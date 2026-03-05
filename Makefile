SHELL := /bin/bash

.PHONY: help
help:
	@echo 'Usage:'
	@echo '    backup'
	@echo '    packages'
	@echo '    packages-flatpaks'
	@echo '    repos'
	@echo '    restore'
	@echo '    secrets'
	@echo '    symlinks'

.PHONY: symlinks
symlinks:
	ln -sf ${PWD}/nvim ${HOME}/.config
	ln -sf ${PWD}/vimrc ${HOME}/.vimrc
	ln -sf ${PWD}/wezterm ${HOME}/.config
	ln -sf ${PWD}/tmux ${HOME}/.config
	ln -sf ${PWD}/zsh/zshrc ${HOME}/.zshrc
	rm -rf ${HOME}/.config/i3
	ln -sf ${PWD}/i3 ${HOME}/.config
	ln -sf ${PWD}/alacritty/alacritty.arch.toml ${HOME}/.config/alacritty/alacritty.toml; \
	ln -sf ${PWD}/wofi ${HOME}/.config
	ln -sf ${PWD}/eslint ${HOME}/.config
	ln -sf ${PWD}/aerospace ${HOME}/.config
	ln -sf ${PWD}/sway ${HOME}/.config
	ln -sf ${PWD}/waybar ${HOME}/.config
	ln -sf ${PWD}/git/gitconfig ${HOME}/.gitconfig
	ln -sf ${PWD}/mimeapps.list ${HOME}/.config
	ln -sf ${PWD}/Xresources ${HOME}/.Xresources
	ln -sf ${PWD}/xprofile ${HOME}/.xprofile
	sudo ln -sf ${PWD}/xorg.conf.d/* /etc/X11/xorg.conf.d/

.PHONY: packages
packages:
	command -v yay &> /dev/null || \
		(sudo pacman -S --needed --noconfirm git base-devel && \
		git clone https://aur.archlinux.org/yay.git ~/wte/yay && \
		cd ~/wte/yay && \
		makepkg -si)
	yay --noconfirm --needed -S \
		bind-tools \
		bluez \
		bluez-utils \
		cmake \
		docker \
		docker-buildx \
		docker-compose \
		fd \
		feh \
		firefox \
		flameshot \
		flatpak \
		fuse3 \
		fzf \
		gcc \
		gvim \
		htop \
		jq \
		lazygit \
		librewolf-bin \
		llama.cpp-vulkan \
		lua \
		make \
		man \
		mariadb \
		mpv \
		neovim \
		nvm \
		postgresql \
		rbw \
		restic \
		rg \
		ripgrep \
		sqlite \
		steam \
		tldr \
		ttf-firacode-nerd\
		unzip \
		visual-studio-code-bin \
		wezterm \
		xclip \
		xorg-xinput \
		xorg-xrandr \
		ytdl \
		visual-studio-code-bin \
		zsh

.PHONY: packages-flatpaks
packages-flatpaks:
	flatpak install \
		com.spotify.Client \
		com.discordapp.Discord \
		com.usebottles.bottles

.PHONY: backup
backup:
	rsync -avz ~/Downloads ~/Models  ~/.cache/librewolf/ ~/Documents  ~/Videos/ wteos.wte.sh:/mnt/backups

.PHONY: restore
restore:
	rsync -avz wteos.wte.sh:/mnt/backups/Downloads ~
	rsync -avz wteos.wte.sh:/mnt/backups/Models ~
	rsync wteos.wte.sh:/mnt/backups/librewolf ~/.cache/librewolf
	rsync wteos.wte.sh:/mnt/backups/Downloads ~

.PHONY: secrets
secrets:
	# rbw login
	rbw config set email earl.jonathan@gmail.com
	mkdir -p ~/.ssh
	rbw get secrets > ~/.secrets
	rbw get ssh-private > ~/.ssh/id_ed25519
	rbw get ssh-public > ~/.ssh/id_ed25519.pub
	sudo -u ${USER} chmod 600 ~/.secrets
	sudo -u ${USER} chmod 600 ~/.ssh/id_ed25519
	sudo -u ${USER} chmod 644 ~/.ssh/id_ed25519.pub
	sudo -u ${USER} chmod 700 ~/.ssh

.PHONY: repos 
repos:
	@test -d ~/.oh-my-zsh || git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
	@test -d ~/.zsh/powerlevel10k || git clone --depth 1 https://github.com/romkatv/powerlevel10k  ~/.zsh/powerlevel10k
	@test -d ~/.zsh/zsh-syntax-highlighting || git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
	@test -d ~/wte/dotfiles || git clone git@github.com:whattheearl/dotfiles ~/wte/dotfiles
	@test -d ~/wte/notes || git clone wteos.wte.sh:notes ~/wte/notes
	@test -d ~/wte/ai || git clone wteos.wte.sh:ai ~/wte/ai && cd ~/wte/ai && npm i
	@test -d ~/wte/tracker || git clone wteos.wte.sh:tracker ~/wte/tracker && cd ~/wte/tracker && npm i
