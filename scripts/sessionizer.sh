#! /usr/bin/env bash

# reference https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer
project_path=$1
if [ ! -d "$project_path" ]; then
  directories=$(find ~/tyl/* ~/wte/* -maxdepth 0 -type d)
  if [ -z $project_path ]; then
    project_path=$(echo "$directories" | fzf)
  else
    project_path=$(echo "$directories" | fzf --query $project_path)
  fi

  if [ "$project_path" = "" ]; then
    return 0
  fi
fi

session_name="$(basename $project_path)"

if [ "$TERM_PROGRAM" != "tmux" ]; then
  tmux attach -t $session_name || tmux new -s $session_name -c $project_path
else
  tmux new -s $session_name -d -c $project_path &> /dev/null
  tmux switch-client -t $session_name
fi
 
