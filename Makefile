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
	ln -sf ${PWD}/sway ${HOME}/.config
	ln -sf ${PWD}/wofi ${HOME}/.config

## nvim
nvim:
	@rm -rf ${BUILD_DIR}/neovim
	@git clone --depth 1 -b v0.10.3 https://github.com/neovim/neovim ${BUILD_DIR}/neovim
	@cd ${BUILD_DIR}/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
	@echo "\n\nRun 'sudo cp ${BUILD_DIR}/neovim/build/bin/nvim /usr/local/bin/nvim'"

## fzf
fzf:
	@rm -rf ${BUILD_DIR}/fzf
	@git clone --depth 1 https://github.com/junegunn/fzf ${BUILD_DIR}/fzf
	@FZF_VERSION=0.57.0 make -C ${BUILD_DIR}/fzf
	@echo "\n\nRun 'sudo cp ${BUILD_DIR}/fzf/target/fzf-linux_amd64 /usr/local/bin/fzf'"

## clean-nvim
clean-nvim: 
	rm -rf ~/.cache/nvim ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim
