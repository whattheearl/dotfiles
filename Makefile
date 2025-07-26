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
	ln -sf ${PWD}/aerospace ${HOME}/.config
	ln -sf ${PWD}/sway ${HOME}/.config
	ln -sf ${PWD}/waybar ${HOME}/.config
	sudo rm -rf /etc/X11/xorg.conf.d && sudo ln -sf ${PWD}/xorg.conf.d /etc/X11

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
		bluez \
		bluez-utils \
		docker \
		docker-buildx \
		docker-compose \
		dotnet-sdk-8.0 \
		dotnet-sdk-9.0 \
		fd \
		firefox \
		flameshot \
		flatpak \
		fuse3 \
		fzf \
		feh \
		gcc \
		git \
		jq \
		lazygit-git \
		librewolf \
		lua \
		make \
		man \
		mariadb \
		neovim \
		nvm \
		postgresql \
		rbw \
		restic \
		ripgrep \
		spotify \
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
		zsh
	sudo ln -s /usr/bin/fusermount3 /usr/bin/fusermount
	flatpak install \
		com.usebottles.bottles \
		dev.vencord.Vesktop \
		io.gitlab.librewolf-community

## packages-fedora: installs fedora packages
packages-fedora:
	sudo dnf copr enable atim/lazygit -y
	sudo dnf install -y \
		docker-cli \
		docker-compose \
		dotnet-sdk-8.0 \
		dotnet-sdk-9.0 \
		fd \
		fira-code-fonts \
		fzf \
		gh \
		htop \
		lazygit \
		nvim \
		rbw \
		sddm \
		sqlite3 \
		sway \
		tldr \
		vim \
		zsh
	flatpak install \
		dev.vencord.Vesktop \
		io.gitlab.librewolf-community \
		org.wezfurlong.wezterm
	sudo ln -s /usr/bin/fusermount3 /usr/bin/fusermount
	flatpak install \
		com.discordapp.Discord \
		com.usebottles.bottles

## secrets: adds ssh, envvars keys 
secrets:
	# rbw login
	rbw config set email earl.jonathan@gmail.com
	mkdir -p ${HOME}/.ssh
	rbw get ssh-public > ${HOME}/.ssh/id_ed25519.pub
	rbw get ssh-private > ${HOME}/.ssh/id_ed25519
	rbw get secrets > ${HOME}/.secrets
	sudo -u ${USER} chmod 700 ${HOME}/.ssh/id_ed25519
	sudo -u ${USER} chmod 700 ${HOME}/.secrets

## repos: install repositories
repos:
	@test -d ${HOME}/tyl/tcp-admincenter || git clone git@github.com:tyler-technologies/tcp-admincenter ${HOME}/tyl/tcp-admincenter
	@test -d ${HOME}/tyl/tcp-ops-center || git clone git@github.com:tyler-technologies/tcp-ops-center ${HOME}/tyl/tcp-ops-center
	@test -d ${HOME}/tyl/tcp-branding-api || git clone git@github.com:tyler-technologies/tcp-branding-api ${HOME}/tyl/tcp-branding-api
	@test -d ${HOME}/tyl/dev-cli || git clone git@github.com:tyler-technologies/dev-cli ${HOME}/tyl/dev-cli
	@test -d ${HOME}/wte/dotfiles || git clone git@github.com:whattheearl/dotfiles ${HOME}/wte/dotfiles
	@test -d ${HOME}/wte/notes || git clone wteos.wte.sh:notes ${HOME}/notes
	@test -d ~/.oh-my-zsh || git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
	@test -d ~/.zsh/zsh-autosuggestions || git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	@test -d ~/.zsh/zsh-history-substring-search || git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
	@test -d ~/.zsh/zsh-syntax-highlighting || git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
	@test -d ~/.zsh/powerlevel10k || git clone --depth 1 https://github.com/romkatv/powerlevel10k  ~/.zsh/powerlevel10k
