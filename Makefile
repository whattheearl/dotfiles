SHELL := /bin/bash
HOSTNAME := $$(hostnamectl hostname)

.PHONY: help
help:
	@echo 'Usage:'
	@echo '    all'
	@echo '    packages-arch'
	@echo '    packages-asahi'
	@echo '    repos'
	@echo '    secrets'
	@echo '    symlinks'

.PHONY: all
all:
	if [[ "${HOSTNAME}" == "ws" ]]; then \
		make packages-arch; \
	elif \
	[[ "${HOSTNAME}" == "asahi" ]]; then \
		make packages-asahi; \
	fi
	make secrets
	make repos
	make symlinks

.PHONY: symlinks
symlinks:
	sudo ln -sf ${PWD}/xorg.conf.d/* /etc/X11/xorg.conf.d/
	sudo ln -s /usr/bin/fusermount3 /usr/bin/fusermount || true
	rm -rf ${HOME}/.config/i3
	mkdir -p ${HOME}/.config/alacritty
	if [[ "${HOSTNAME}" == "ws" ]]; then \
		ln -sf ${PWD}/alacritty/alacritty.ws.toml ${HOME}/.config/alacritty/alacritty.toml; \
	elif [[ "${HOSTNAME}" == "asahi" ]] then \
		ln -sf ${PWD}/alacritty/alacritty.asahi.toml ${HOME}/.config/alacritty/alacritty.toml; \
		sudo ln -sf /usr/bin/vimx /usr/bin/vim || true; \
	fi
	ln -sf ${PWD}/aerospace ${HOME}/.config
	ln -sf ${PWD}/eslint ${HOME}/.config
	ln -sf ${PWD}/git/gitconfig ${HOME}/.gitconfig
	ln -sf ${PWD}/i3 ${HOME}/.config
	ln -sf ${PWD}/mimeapps.list ${HOME}/.config
	ln -sf ${PWD}/nvim ${HOME}/.config
	ln -sf ${PWD}/sway ${HOME}/.config
	ln -sf ${PWD}/tmux ${HOME}/.config
	ln -sf ${PWD}/vimrc ${HOME}/.vimrc
	ln -sf ${PWD}/waybar ${HOME}/.config
	ln -sf ${PWD}/wofi ${HOME}/.config
	ln -sf ${PWD}/xprofile ${HOME}/.xprofile
	ln -sf ${PWD}/Xresources ${HOME}/.Xresources
	ln -sf ${PWD}/ripgreprc ${HOME}/.ripgreprc
	ln -sf ${PWD}/zsh/zshrc ${HOME}/.zshrc

.PHONY: packages-arch
packages-arch:
	command -v yay &> /dev/null || \
		(sudo pacman -S --needed git base-devel && \
		git clone https://aur.archlinux.org/yay.git ~/wte/yay && \
		cd ~/wte/yay && \
		makepkg -si)
	yay --noconfirm --needed -S \
		alacritty \
		age \
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
		xclip \
		xorg-xinput \
		xorg-xrandr \
		ytdl \
		zsh
	flatpak install \
		com.usebottles.bottles


.PHONY: packages-asahi
packages-asahi:
	sudo dnf install -y \
		alacritty \
		age \
		brightnessctl \
		docker-cli \
		docker-compose \
		fd \
		fira-code-fonts \
		firefox \
		fzf \
		htop \
		lazygit \
		librewolf \
		luarocks \
		nvim \
		rbw \
		restic \
		sddm \
		sqlite3 \
		sway \
		tldr \
		vim-X11 \
		zsh

.PHONY: secrets
secrets:
	@echo "secrets setup"
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
	@test -d ~/.nvm || git clone https://github.com/nvm-sh/nvm.git ~/.nvm
	@test -d ~/.oh-my-zsh || git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
	@test -d ~/.zsh/powerlevel10k || git clone --depth 1 https://github.com/romkatv/powerlevel10k  ~/.zsh/powerlevel10k
	@test -d ~/.zsh/zsh-syntax-highlighting || git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
	@test -d ~/wte/dotfiles || git clone git@github.com:whattheearl/dotfiles ~/wte/dotfiles
	@test -d ~/wte/notes || git clone wteos.wte.sh:notes ~/wte/notes
	@test -d ~/wte/ai || git clone wteos.wte.sh:ai ~/wte/ai && cd ~/wte/ai
	@test -d ~/wte/tracker || git clone wteos.wte.sh:tracker ~/wte/tracker
