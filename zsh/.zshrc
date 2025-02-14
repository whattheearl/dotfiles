#! /usr/bin/env bash

bindkey -e

export DOTNET_CLI_TELEMETRY_OPTOUT='true'
export NVM_DIR=${HOME}/.nvm
export BUN_INSTALL=$HOME/.bun
export EDITOR=nvim
HISTFILE=${HOME}/.zsh_history
SAVEHIST=100000
setopt inc_append_history
setopt share_history
[ -s "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -s "/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" ] && source "/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" 
[ -s "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -s "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ] && source "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme"
[ -s "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"
[ -s "$HOME/.cache/p10k-instant-prompt-${(%):-%n}.zsh" ] && source "$HOME/.cache/p10k-instant-prompt-${(%):-%n}.zsh"
[ -s "/home/jon/.bun/_bun" ] && source "/home/jon/.bun/_bun"
[ -s "/Users/jon/.bun/_bun" ] && source "/Users/jon/.bun/_bun"
[ -s ~/.p10k.zsh ] && source ~/.p10k.zsh
[ -s ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s $HOME/.config/zsh/secrets.sh ] && source $HOME/.config/zsh/secrets.sh

export PATH=$PATH:/Users/jon/.dotnet/tools
export PATH=$PATH:$HOME/.config/homebrew/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$BUN_INSTALL/bin:$PATH
export PATH=$HOME/tyl/dev-cli/bin:$PATH
export PATH=$PATH:/opt/nvim-linux64/bin
export PATH=$PATH:$HOME/.cargo/env
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.deno/bin
export PATH=$PATH:$HOME/.dotnet/tools/kiota
export PATH=$PATH:/opt/nvim-linux64/bin
export PATH=$PATH:$HOME/wte/dotfiles/scripts

alias b="bs docker-reset"
alias t="bs test-integration"
alias client="make -C ~/tyl/tcp-ops-center client"
alias bff="make -C ~/tyl/tcp-ops-center bff"
alias v=nvim $@
alias dev="bun run ~/tyl/dev-cli/dist/index.js $@"
alias dc="docker compose $@"
alias tcp="docker compose -f ~/tyl/platform-dev-environment-compose/docker-compose.yml $@"
alias tid="docker compose -f ~/tyl/platform-dev-environment-compose/docker-compose.yml -f ~/tyl/platform-dev-environment-compose/docker-compose.tid.yml $@"
alias bs="make -C ~/tyl/tcp-branding-api $@"
alias bsc="docker compose -f ~/tyl/tcp-branding-api/docker-compose.yaml $@"
alias lg="lazygit"
alias jed="make -C ~/wte/jeddit $@"
alias wte="make -C ~/wte/wteos $@"
alias n="cd ~/wte/notes && v ~/wte/notes/today.md"
alias cds=$HOME/wte/dotfiles/scripts/sessionizer.sh $@
alias devd=$HOME/tyl/dev-cli/src/index.ts $@
alias ec="cd $HOME/wte/dotfiles && v ."
alias ez="cd $HOME/wte/dotfiles/zsh && v .zshrc"
alias en="cd $HOME/wte/dotfiles/nvim && v init.lua"
alias et="cd $HOME/wte/dotfiles/tmux && v tmux.conf"
alias ew="cd $HOME/wte/dotfiles/wezterm && v wezterm.lua"

function add-make() {
  cp ~/wte/dotfiles/templates/Makefile .
}

function add-npmrc() {
  cp ~/wte/dotfiles/templates/.npmrc .
}

function add-editorconfig() {
  cp ~/wte/dotfiles/templates/.editorconfig .
}

function add-nugetconfig() {
  cp ~/wte/dotfiles/templates/NuGet.config .
}

function add-prettierrc() {
  cp ~/wte/dotfiles/templates/.prettierrc .
}

