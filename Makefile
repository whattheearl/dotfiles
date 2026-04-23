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
	[[ -d ~/.nvm ]] || git clone https://github.com/nvm-sh/nvm.git ~/.nvm
	[[ -d ~/.oh-my-zsh ]] || git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
	[[ -d ~/.zsh/powerlevel10k ]] || git clone --depth 1 https://github.com/romkatv/powerlevel10k  ~/.zsh/powerlevel10k
	[[ -d ~/.zsh/zsh-syntax-highlighting ]] || git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
	[[ -d ~/wte/dotfiles ]] || git clone git@github.com:whattheearl/dotfiles ~/wte/dotfiles
	[[ -d ~/wte/notes ]] || git clone wteos.wte.sh:notes ~/wte/notes
	[[ -d ~/wte/ai ]] || git clone wteos.wte.sh:ai ~/wte/ai && cd ~/wte/ai
	[[ -d ~/wte/tracker ]] || git clone wteos.wte.sh:tracker ~/wte/tracker
