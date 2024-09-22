config_folder = ~/.config

# ==================================================================================== #
# HELPERS
# ==================================================================================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@echo ${MAKEFILE_LIST}
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

.PHONY: confirm
confirm:
	@echo -n 'Are you sure? [y/N] ' && read ans && [ $${ans:-N} = y ]

.PHONY: no-dirty
no-dirty:
	@test -z "$(shell git status --porcelain)"

# ==================================================================================== #
# QUALITY CONTROL
# ==================================================================================== #

## format: format files
format:
	@bunx prettier . --write

# ==================================================================================== #
# OPERATIONS
# ==================================================================================== #

## push: push to github
push: format no-dirty
	git push

## install: copys configuration to $XDG_CONFIG_HOME/.config/*
install:
	@rm -rf ${config_folder}/nvim
	@rm -rf ${config_folder}/wezterm
	@rm -rf ${config_folder}/tmux
	@rm -rf ${config_folder}/zsh
	@cp -r ./config/* ${config_folder}

## sync: synchronize configuration
sync:
	@rm -rf ./config/nvim/.git
	@cp -r ${config_folder}/nvim ./config
	@cp -r ${config_folder}/wezterm ./config
	@cp -r ${config_folder}/tmux ./config
	@cp -r ${config_folder}/zsh ./config
