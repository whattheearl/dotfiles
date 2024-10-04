#! /usr/env/bin zsh
# settings > keyboard > keyboard shortcuts > custom shortcuts
# alacritty -e /home/jon/wte/docs/scripts/find-project.sh

function cds() {
  # TODO: filter by input? check if only one result and automatically complete?
  project_path="$(find ~ -maxdepth 2 -type d -path '/home/jon/wte/**' -or -path '/home/jon/tyl/**' -not -path '*/.cache*' | fzf)"
  session_name="$(basename $project_path)"
  if [ "$TERM_PROGRAM" != "tmux" ]; then
    tmux attach -t $session_name || tmux new -s $session_name -c $project_path
  else
    tmux new -s $session_name -d -c $project_path &> /dev/null
    tmux switch-client -t $session_name
  fi
}

function caps-to-control() {
  gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
  setxkbmap -option caps:ctrl_modifier 
}

function open-project-session() {
  selected_folder="$(find ~ -maxdepth 2 -type d -path '/home/jon/wte/**' -or -path '/home/jon/tyl/**' -not -path '*/.cache*' | fzf)"
  folder="$(basename $selected_folder)"
  if $(tmux ls | grep -q $folder); then
    tmux a -t $folder
  else	
    cd $selected_folder
    tmux new-session -n tmux -d
    tmux rename-session $folder
    tmux rename-window $folder
    tmux a
  fi
}


