#!/usr/bin/env bash

# INFO: wezterm start -- zsh -i -e ~/script

folder=$(fd "./*" --type directory --max-depth 1 ${HOME}/tyl ${HOME}/wte | fzf);
cd ${folder}
nvim ${folder};
zsh;
