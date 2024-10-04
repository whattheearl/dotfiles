#! /usr/env/bin zsh
# settings > keyboard > keyboard shortcuts > custom shortcuts
# alacritty -e /home/jon/wte/docs/scripts/find-project.sh

# TODO: explore filter by input, autoexpand
function tmuxp() {
  project_path="$(find ~ -maxdepth 2 -type d -path '/home/jon/wte/**' -or -path '/home/jon/tyl/**' -not -path '*/.cache*' | fzf)"
  session_name="$(basename $project_path)"
  if [ "$TERM_PROGRAM" != "tmux" ]; then
    tmux attach -t $session_name || tmux new -s $session_name -c $project_path
  else
    tmux new -s $session_name -d -c $project_path &> /dev/null
    tmux switch-client -t $session_name
  fi
}

function cdp() {
  cd "$(find ~ -maxdepth 2 -type d -path '/home/jon/wte/**' -or -path '/home/jon/tyl/**' -not -path '*/.cache*' | fzf)"
}

function caps-to-control() {
  gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
  setxkbmap -option caps:ctrl_modifier 
}
