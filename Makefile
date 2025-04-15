BUILD_DIR=/tmp/dotfile/

.PHONY: help packages symlinks ssh env pacman-packages aur aur-packages flatpak-packages

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

## packages: installs arch packages
pacman-packages:
	sudo pacman -S --noconfirm --needed \
		aspnet-runtime-8.0 \
		base-devel \
		bitwarden-cli \
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
	bw get item bcac7ee2-d117-4341-a81a-b2380125a710 | jq -r ".notes" >> ${HOME}/wte/dotfiles/zsh/secrets.sh

## packages-brew: adds brew packages for air
packages-brew:
	brew install tldr	

## aur: 3rd party package manager
aur:
	git clone https://aur.archlinux.org/yay.git ${HOME}/apps/yay
	cd ${HOME}/apps/yay
	makepkg -si

## packages-aur: installs 3rd party packages
packages-aur:
	yay -Syu --noconfirm \
		oh-my-zsh-git \
		zsh-theme-powerlevel10k-git \
		lazygit-git \
		visual-studio-code-bin
		# nvm

## packages-flatpak: install flatpak applications
packages-flatpak:
	flatpak install com.usebottles.bottles \
	flatpak install com.discordapp.Discord
