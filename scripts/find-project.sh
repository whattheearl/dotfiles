#!/usr/bin/env zsh
# settings > keyboard > keyboard shortcuts > custom shortcuts
# alacritty -e /home/jon/wte/docs/scripts/find-project.sh


source ~/.zshrc
selected_folder="$(find ~ -maxdepth 2 -type d -path '/home/jon/wte/**' -or -path '/home/jon/tyl/**' -not -path '*/.cache*' | /home/jon/.fzf/bin/fzf)"
folder="$(basename $selected_folder)"
i $(tmux ls | grep -q $folder); then
	tmux a -t $folder
else	
	cd $selected_folder
	tmux new-session -n tmux -d
	tmux rename-session $folder
	tmux a
fi
