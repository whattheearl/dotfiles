#! /usr/env/bin zsh

# TODO: explore filter by input, autoexpand
function cds() {
  project_path="$(find ~ -maxdepth 2 -type d -path '/home/jon/wte/**' -or -path '/home/jon/tyl/**' -not -path '*/.cache*' | fzf)"
  if [ "$project_path" = "" ]; then
    return 0
  fi

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
