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
	cp -r ./config/* "$XDG_CONFIG_HOME/.config/"
