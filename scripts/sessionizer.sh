#!/usr/bin/env bash

# INFO: reference https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer
selected=$(find $HOME/wte $HOME/tyl -maxdepth 1 -mindepth 1 -type d | fzf)
if [[ -z "$selected" ]]; then
    exit 0
fi
session_name="$(basename $selected)"

if [ "$TERM_PROGRAM" != "tmux" ]; then
    tmux attach -t $session_name || tmux new -s $session_name -c $selected
else
    tmux new -s $session_name -d -c $selected &> /dev/null
    tmux switch-client -t $session_name
fi
