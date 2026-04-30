#!/bin/sh

function symlinkDotfiles() {
	git clone https://github.com/whattheearl/dotfiles "${HOME}/wte/dotfiles" 2>/dev/null || true
	cd "${HOME}/wte/dotfiles"
	ln -sf "${PWD}/bashrc" "${HOME}/.bashrc"
	ln -sf "${PWD}/bunfig.toml" "${HOME}/.bunfig.toml"
	ln -sf "${PWD}/git/gitconfig" "${HOME}/.gitconfig"
	rmdir "${HOME}/.config/i3" > /dev/null 2>&1 || true
	ln -sf "${PWD}/i3" "${HOME}/.config"
	ln -sf "${PWD}/mimeapps.list" "${HOME}/.config"
	ln -sf "${PWD}/npmrc" "${HOME}/.npmrc"
	ln -sf "${PWD}/nvim" "${HOME}/.config"
	ln -sf "${PWD}/ripgreprc" "${HOME}/.ripgreprc"
	ln -sf "${PWD}/sway" "${HOME}/.config"
	ln -sf "${PWD}/tmux" "${HOME}/.config"
	ln -sf "${PWD}/waybar" "${HOME}/.config"
	ln -sf "${PWD}/wofi" "${HOME}/.config"
	ln -sf "${PWD}/xorg.conf.d" "${HOME}/.xorg.conf.d"
	ln -sf "${PWD}/xprofile" "${HOME}/.xprofile"
	ln -sf "${PWD}/Xresources" "${HOME}/.Xresources"
}

function createSecrets() {
	rbw config set email earl.jonathan@gmail.com
	mkdir -p ~/.ssh
	rbw get secrets > ~/.secrets
	rbw get ssh-private > ~/.ssh/id_ed25519
	rbw get ssh-public > ~/.ssh/id_ed25519.pub
	sudo -u ${USER} chmod 600 ~/.secrets
	sudo -u ${USER} chmod 600 ~/.ssh/id_ed25519
	sudo -u ${USER} chmod 644 ~/.ssh/id_ed25519.pub
	sudo -u ${USER} chmod 700 ~/.ssh
}

function cloneRepos() {
	[ ! -d ~/wte/dotfiles ] && git clone git@github.com:whattheearl/dotfiles ~/wte/dotfiles
	[ ! -d ~/wte/notes ] && git clone wteos.wte.sh:notes ~/wte/notes
	[ ! -d ~/wte/ai ] && (git clone wteos.wte.sh:ai ~/wte/ai && cd ~/wte/ai && bun install && make install)
	[ ! -d ~/wte/tracker ] && git clone wteos.wte.sh:tracker ~/wte/tracker
}

function changeShell() {
	chsh -s /bin/sh
}
