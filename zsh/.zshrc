#! /usr/bin/env bash

bindkey -e

export DOTNET_CLI_TELEMETRY_OPTOUT='true'
export NVM_DIR=${HOME}/.nvm
export BUN_INSTALL=$HOME/.bun
export EDITOR=nvim

[ -s "/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" ] && source "/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" 
[ -s "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -s "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -s "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ] && source "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme"
[ -s "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[ -s "/home/jon/.bun/_bun" ] && source "/home/jon/.bun/_bun"
[ -s "/Users/jon/.bun/_bun" ] && source "/Users/jon/.bun/_bun"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

function cdp() {
  cd "$(find ~ -maxdepth 2 -type d -path '/home/jon/wte/**' -or -path '/home/jon/tyl/**' -not -path '*/.cache*' | fzf)"
}

function gnome-customize() {
  gsettings set org.gnome.desktop.interface enable-animations false
  gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape', 'altwin:swap_alt_win']"
}

function gnome-reset() { 
  gsettings set org.gnome.desktop.interface enable-animations true
  gsettings set org.gnome.desktop.input-sources xkb-options "[]"
}

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
  # add to package.json dev
  # add format script
  cp ~/wte/dotfiles/templates/.prettierrc .
}

source $HOME/.config/zsh/secrets.sh

