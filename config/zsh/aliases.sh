alias dc="docker compose $@"

alias tcp="docker compose -f ~/tyl/platform-dev-environment-compose/docker-compose.yml $@"
alias tid="docker compose -f ~/tyl/platform-dev-environment-compose/docker-compose.yml -f ~/tyl/platform-dev-environment-compose/docker-compose.tid.yml $@"

alias bs="make -C ~/tyl/v2brandingservice $@"
alias bsc="docker compose -f ~/tyl/v2brandingservice/docker-compose.yml $@"

alias v=nvim $@
alias config="cd ~/wte/docs && v ~/wte/docs"
alias n="cd ~/wte/notes && v ~/wte/notes/today.md"

alias cds=$HOME/wte/docs/scripts/sessionizer.sh $@
alias devd=$HOME/tyl/dev-cli/src/index.ts $@
