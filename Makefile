.PHONY: help install clean-nvim

## help: print this help message
help:
	@echo 'Usage:'
	@echo ${MAKEFILE_LIST}
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## install
install:
	ln -sf ${PWD}/nvim ${HOME}/.config
	ln -sf ${PWD}/wezterm ${HOME}/.config
	ln -sf ${PWD}/tmux ${HOME}/.config
	ln -sf ${PWD}/zsh/.zshrc ${HOME}/.zshrc
	ln -sf ${PWD}/zsh ${HOME}/.config
	ln -sf ${PWD}/sway ${HOME}/.config
	ln -sf ${PWD}/wofi ${HOME}/.config

## clean-nvim
clean-nvim: 
	rm -rf ~/.cache/nvim ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim
