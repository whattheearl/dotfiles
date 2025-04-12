#! /usr/bin/env bash

bindkey -e

alias b="make -C ~/tyl/tcp-branding-api docker-test"
alias r="make -C ~/tyl/tcp-branding-api docker-reset && make -C ~/tyl/tcp-branding-api docker-test"
alias t="make -C ~/tyl/tcp-branding-api test-integration"

alias client="make -C ~/tyl/tcp-ops-center client"
alias bff="make -C ~/tyl/tcp-ops-center bff"
alias v="nvim $@"
alias dev="bun run ~/tyl/dev-cli/dist/index.js $@"
alias tcp="docker compose -f ~/tyl/platform-dev-environment-compose/docker-compose.yml $@"
alias tid="docker compose -f ~/tyl/platform-dev-environment-compose/docker-compose.yml -f ~/tyl/platform-dev-environment-compose/docker-compose.tid.yml $@"
alias bs="docker compose -f ~/tyl/tcp-branding-api/docker-compose.yaml $@"
alias lg="lazygit"
alias n="cd ~/wte/notes && v ~/wte/notes/today.md"
alias devd=$HOME/tyl/dev-cli/src/index.ts $@
alias e-zshrc="nvim ~/.zshrc"
alias e-dotfiles="cd $HOME/wte/dotfiles && nvim ./readme.md"
alias e-neovim="cd $HOME/wte/dotfiles/nvim && nvim ./init.lua"
alias e-wezterm="cd $HOME/wte/dotfiles/wezterm && v wezterm.lua"
alias ff-opscenter="firefox http://admin.tcpci.com/portal/ops-center &"
alias ff-admincenter="firefox https://dev-admin.tcpci.com/org/admin-center/dashboard &"
alias cp-make="cp ~/wte/dotfiles/templates/Makefile ."
alias cp-npmrc="cp ~/wte/dotfiles/templates/.npmrc ."
alias cp-editconfig="cp ~/wte/dotfiles/templates/.editorconfig ."
alias cp-nugetconfig="cp ~/wte/dotfiles/templates/NuGet.config ."
alias cp-prettierrc="cp ~/wte/dotfiles/templates/.prettierrc ."

export DOTNET_CLI_TELEMETRY_OPTOUT='true'
export NVM_DIR=${HOME}/.nvm
export BUN_INSTALL=$HOME/.bun
export EDITOR=nvim
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

ZSH=/usr/share/oh-my-zsh/
plugins=(git docker-compose)
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

[ -s "$ZSH/oh-my-zsh.sh" ] && source $ZSH/oh-my-zsh.sh
[ -s "/home/jon/.bun/_bun" ] && source "/home/jon/.bun/_bun"
[ -s "/home/jon/.cache/p10k-instant-prompt-${(%):-%n}.zsh" ] && source "$HOME/.cache/p10k-instant-prompt-${(%):-%n}.zsh"
[ -s "/home/jon/.config/zsh/secrets.sh" ] && source $HOME/.config/zsh/secrets.sh
[ -s "/home/jon/.fzf.zsh" ] && source ~/.fzf.zsh
[ -s "/home/jon/.p10k.zsh" ] && source ~/.p10k.zsh
[ -s "/home/jon/tyl/google-identity/google-cloud-sdk/completion.zsh.inc" ] && source "/home/jon/tyl/google-identity/google-cloud-sdk/completion.zsh.inc"
[ -s "/home/jon/tyl/google-identity/google-cloud-sdk/path.zsh.inc" ] && source "/home/jon/tyl/google-identity/google-cloud-sdk/path.zsh.inc"
[ -s "/Users/jon/.bun/_bun" ] && source "/Users/jon/.bun/_bun"
[ -s "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"
[ -s "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ] && source "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme"
[ -s "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -s "/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" ] && source "/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" 
[ -s "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

function claude() {
  local prompt="$1"
  shift
  curl -s -X POST https://api.anthropic.com/v1/messages \
    -H "Content-Type: application/json" \
    -H "x-api-key: $AI_CLAUDE" \
    -H "anthropic-version: 2023-06-01" \
    -d "{
      \"model\": \"claude-3-7-sonnet-20250219\",
      \"max_tokens\": 1024,
      \"messages\": [
        {\"role\": \"user\", \"content\": \"$prompt\"}
      ]
    }" | jq -r ".content[0].text" $@
}

function gemini() {
    local prompt="$1"
    shift
    curl -s "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${AI_GEMINI}" \
    -H 'Content-Type: application/json' \
    -X POST \
    -d  "{
      \"contents\": [
        {\"parts\": [{\"text\": \"$prompt\"}]}
      ]
    }" | jq -r ".candidates[0].content.parts[0].text" $@
}
