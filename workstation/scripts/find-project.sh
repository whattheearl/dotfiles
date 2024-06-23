#!/bin/bash
folder="$(find ~ -maxdepth 2 -type d -path '/home/jon/wte/**' -or -path '/home/jon/tyl/**' | fzf)"
cd $folder
ls
tmux new-session -n $folder -d 'nvim .'
tmux a
