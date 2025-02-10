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
	sudo pacman -S bluez bluez-utils
	sudo pacman -S wezterm \
		zsh \
		zsh-history-substring-search \
		zsh-autosuggestions \
		zsh-syntax-highlighting
	sudo pacman -S git \
		make \
		neovim \
		code \
		jq \
		base-devel \
		dotnet-sdk-8.0 \
		lua
	sudo pacman -S firefox \
		bitwarden-cli \
		xorg-xrandr

## ssh: adds ssh keys
ssh:
	bw get item 84174bac-6c19-4711-9af9-b27f0176f102 | jq -r ".sshKey.privateKey" > .ssh/id_ed25519
	bw get item 84174bac-6c19-4711-9af9-b27f0176f102 | jq -r ".sshKey.publicKey" > .ssh/id_ed25519.pub
	chmod 400 $HOME/.ssh/id_ed25519m -rf ~/.cache/nvim ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim

## aur: 3rd party package manager
aur:
	git clone https://aur.archlinux.org/yay.git $HOME/apps/yay
	cd "${HOME}/apps/yay"
	makepkg -si

## aur-packages: installs 3rd party packages
aur-packages:
	yay -S oh-my-zsh-git \
		zsh-theme-powerlevel10k-git \
		lazygit-git

