BUILD_DIR=/tmp/dotfile/

.PHONY: help install clean-nvim nvim fzf

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
	ln -sf ${PWD}/zsh/.zshrc ${HOME}/.zshrc
	ln -sf ${PWD}/zsh ${HOME}/.config
	ln -sf ${PWD}/i3 ${HOME}/.config
	# ln -sf ${PWD}/sway ${HOME}/.config
	ln -sf ${PWD}/wofi ${HOME}/.config

## packages: installs arch packages
packages:
	sudo pacman -S --noconfirm --needed \
		aspnet-runtime-8.0 \
		base-devel \
		bitwarden-cli \
		bluez \
		bluez-utils \
		code \
		docker \
		docker-buildx \
		docker-compose \
		dotnet-sdk-8.0 \
		fd \
		firefox \
		flatpak \
		gcc \
		git \
		jq \
		lua \
		make \
		man \
		mariadb \
		neovim \
		postgresql \
		restic \
		ripgrep \
		tldr \
		unzip \
		wezterm \
		xclip \
		xorg-xrandr \
		zsh \
		zsh-autosuggestions \
		zsh-history-substring-search \
		zsh-syntax-highlighting

## ssh: adds ssh keys
ssh:
	mkdir -p ${HOME}/.ssh
	bw get item 84174bac-6c19-4711-9af9-b27f0176f102 | jq -r ".sshKey.privateKey" > ${HOME}/.ssh/id_ed25519
	bw get item 84174bac-6c19-4711-9af9-b27f0176f102 | jq -r ".sshKey.publicKey" > ${HOME}/.ssh/id_ed25519.pub
	chmod 400 ${HOME}/.ssh/id_ed25519

## env: adds envvars
env:
	bw get item bcac7ee2-d117-4341-a81a-b2380125a710 | jq -r ".notes" > ${HOME}/wte/dotfiles/zsh/secrets.sh

## aur: 3rd party package manager
aur:
	git clone https://aur.archlinux.org/yay.git ${HOME}/apps/yay
	cd ${HOME}/apps/yay
	makepkg -si

## aur-packages: installs 3rd party packages
aur-packages:
	yay -S --noconfirm \
		zsh-theme-powerlevel10k-git \
		lazygit-git
		# nvm

## flatpak-packages: install flatpak applications
flatpak-packages:
	flatpak install com.usebottles.bottles
