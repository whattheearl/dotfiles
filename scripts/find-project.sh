#!/bin/bash
# settings > keyboard > keyboard shortcuts > custom shortcuts
# alacritty -e /home/jon/wte/docs/scripts/find-project.sh
selected_folder="$(find ~ -maxdepth 2 -type d -path '/home/jon/wte/**' -or -path '/home/jon/tyl/**' -not -path '*/.cache*' | fzf)"
folder="$(basename $selected_folder)"
if $(tmux ls | grep -q $folder); then
	tmux a -t $folder
else	
	cd $selected_folder
	tmux new-session -n tmux -d
	tmux rename-session $folder
	tmux a
fi
