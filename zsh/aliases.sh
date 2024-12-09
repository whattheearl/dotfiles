# vim
alias v=nvim $@

# docker
alias dc="docker compose $@"

# platform
alias tcp="docker compose -f ~/tyl/platform-dev-environment-compose/docker-compose.yml $@"
alias tid="docker compose -f ~/tyl/platform-dev-environment-compose/docker-compose.yml -f ~/tyl/platform-dev-environment-compose/docker-compose.tid.yml $@"

# branding-service
alias bs="make -C ~/tyl/v2brandingservice $@"
alias bsc="docker compose -f ~/tyl/v2brandingservice/docker-compose.yml $@"

# jeddit
alias jed="make -C ~/wte/jeddit $@"

# wteos 
alias wte="make -C ~/wte/wteos $@"

# notes
alias n="cd ~/wte/notes && v ~/wte/notes/today.md"

# tmux-session
alias cds=$HOME/wte/dotfiles/scripts/sessionizer.sh $@

# dev-cli
alias devd=$HOME/tyl/dev-cli/src/index.ts $@

# edit config
alias ec="cd $HOME/wte/dotfiles && v ."
alias ez="cd $HOME/wte/dotfiles/zsh && v .zshrc"
alias en="cd $HOME/wte/dotfiles/nvim && v init.lua"
alias et="cd $HOME/wte/dotfiles/tmux && v tmux.conf"
alias ew="cd $HOME/wte/dotfiles/wezterm && v wezterm.lua"
