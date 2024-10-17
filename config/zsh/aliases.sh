alias tcp="docker compose -f ~/tyl/platform-dev-environment-compose/docker-compose.yml $@"
alias poc="docker compose -f ~/tyl/poc-node-bff/docker-compose/platform-dev-environment-compose//docker-compose.yml $@"
alias tid="docker compose -f ~/tyl/platform-dev-environment-compose/docker-compose.yml -f ~/tyl/platform-dev-environment-compose/docker-compose.tid.yml $@"

alias vim=nvim $@
alias vi=nvim $@

alias cds=~/wte/docs/scripts/sessionizer.sh
alias notes="/home/jon/wte/docs/scripts/sessionizer.sh /home/jon/wte/notes"
alias docs="~/wte/docs/scripts/sessionizer.sh ~/wte/docs"
alias tpc=~/wte/docs/scripts/sessionizer.sh "~/tyl/tcp-profile-c"
alias devd=$HOME/tyl/dev-cli/src/index.ts $@
