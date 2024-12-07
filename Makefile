# ==================================================================================== #
# HELPERS
# ==================================================================================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@echo ${MAKEFILE_LIST}
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

# ==================================================================================== #
# OPERATIONS
# ==================================================================================== #

## install: copys configuration to $HOME/.config/*
install:
	@ln -sf ${PWD}/nvim ${HOME}/.config
	@ln -sf ${PWD}/wezterm ${HOME}/.config
	@ln -sf ${PWD}/tmux ${HOME}/.config
	@ln -sf ${PWD}/zsh ${HOME}/.config
	@ln -sf ${PWD}/sway ${HOME}/.config
	@ln -sf ${PWD}/waybar ${HOME}/.config
	@ln -sf ${PWD}/wofi ${HOME}/.config
