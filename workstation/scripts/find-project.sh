#!/bin/bash
# settings > keyboard > keyboard shortcuts > custom shortcuts
# kitty -e /home/jon/wte/docs/workstation/scripts/find-project.sh
selected_folder="$(find ~ -maxdepth 2 -type d -path '/home/jon/wte/**' -or -path '/home/jon/tyl/**' -not -path '*/.cache*' | fzf)"
if $(tmux ls | grep -q $selected_folder); then
	tmux a -t $selected_folder
else	
	cd $selected_folder
	tmux new-session -n tmux
	tmux rename-session $selected_folder
	tmux a
fi
