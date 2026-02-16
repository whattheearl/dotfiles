.PHONY: help packages-arch packages-fedora symlinks secrets repos
SHELL := /bin/bash

## help: print this help message
help:
	@echo 'Usage:'
	@echo ${MAKEFILE_LIST}
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## symlinks: symlink ~/.config and /etc/X11/xorg.conf.d
symlinks:
	ln -sf ${PWD}/nvim ${HOME}/.config
	ln -sf ${PWD}/vimrc ${HOME}/.vimrc
	ln -sf ${PWD}/wezterm ${HOME}/.config
	ln -sf ${PWD}/tmux ${HOME}/.config
	ln -sf ${PWD}/zsh/zshrc ${HOME}/.zshrc
	rm -rf ${HOME}/.config/i3
	ln -sf ${PWD}/i3 ${HOME}/.config
	echo ${HOSTNAME}
	if [[ ${HOSTNAME} == "fedora" ]]; then \
		ln -sf ${PWD}/alacritty/alacritty.fedora.toml ${HOME}/.config/alacritty/alacritty.toml; \
	elif [[ ${HOSTNAME} == "fedora" ]]; then \
		ln -sf ${PWD}/alacritty/alacritty.fedora.toml ${HOME}/.config/alacritty/alacritty.toml; \
	fi
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

## packages-arch: installs arch packages
packages-arch:
	command -v yay &> /dev/null || \
		(sudo pacman -S --needed git base-devel && \
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
		ytdl \
		visual-studio-code-bin \
		zsh
	sudo ln -s /usr/bin/fusermount3 /usr/bin/fusermount || true
	flatpak install \
		com.discordapp.Discord \
		com.usebottles.bottles
		# io.gitlab.librewolf-community - flatseal issues

## backup: backup data
backup:
	rsync -avz ~/Downloads ~/Models  ~/.cache/librewolf/ ~/Documents  ~/Videos/ wteos.wte.sh:/mnt/backups

## restore: restore data
restore:
	rsync -avz wteos.wte.sh:/mnt/backups/Downloads ~
	rsync -avz wteos.wte.sh:/mnt/backups/Models ~
	rsync wteos.wte.sh:/mnt/backups/librewolf ~/.cache/librewolf
	rsync wteos.wte.sh:/mnt/backups/Downloads ~

## packages-fedora: installs fedora packages
packages-fedora:
	sudo dnf copr enable atim/lazygit -y
	sudo dnf copr enable wezfurlong/wezterm-nightly
	curl -fsSL https://repo.librewolf.net/librewolf.repo | pkexec tee /etc/yum.repos.d/librewolf.repo
	sudo dnf install -y \
		brightnessctl \
		docker-cli \
		docker-compose \
		fd \
		fira-code-fonts \
		fzf \
		github-cli \
		htop \
		lazygit \
		librewolf \
		nvim \
		restic \
		rbw \
		sddm \
		sqlite3 \
		sway \
		tldr \
		vim-X11 \
		wezterm \
		zsh
	sudo ln -s /usr/bin/fusermount3 /usr/bin/fusermount || true
	flatpak install \
		com.discordapp.Discord

## secrets: adds ssh, envvars keys 
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

## repos: install repositories
repos:
	@test -d ~/.nvm || git clone https://github.com/nvm-sh/nvm.git ~/.nvm
	@test -d ~/.oh-my-zsh || git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
	@test -d ~/.zsh/powerlevel10k || git clone --depth 1 https://github.com/romkatv/powerlevel10k  ~/.zsh/powerlevel10k
	@test -d ~/.zsh/zsh-syntax-highlighting || git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
	@test -d ~/tyl/dev-cli || git clone git@github.com:tyler-technologies/dev-cli ~/tyl/dev-cli
	@test -d ~/tyl/tcp-admincenter || git clone git@github.com:tyler-technologies/tcp-admincenter ~/tyl/tcp-admincenter
	@test -d ~/tyl/tcp-branding-api || git clone git@github.com:tyler-technologies/tcp-branding-api ~/tyl/tcp-branding-api
	@test -d ~/tyl/tcp-ops-center || git clone git@github.com:tyler-technologies/tcp-ops-center ~/tyl/tcp-ops-center
	@test -d ~/tyl/platform-dev-environment-compose || git clone git@github.com:tyler-technologies/platform-dev-environment-compose.git ~/tyl/platform-dev-environment-compose
	@test -d ~/wte/dotfiles || git clone git@github.com:whattheearl/dotfiles ~/wte/dotfiles
	@test -d ~/wte/notes || git clone wteos.wte.sh:notes ~/wte/notes
