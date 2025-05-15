#!/usr/bin/env bash

# INFO: temp solution to keep zsh open after opening from i3

folder=$(fd "./*" --type directory --max-depth 1 ${HOME}/tyl ${HOME}/wte | fzf);
cd ${folder}
nvim ${folder};
zsh;
