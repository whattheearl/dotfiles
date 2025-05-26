#! /usr/bin/env bash

folder=$(fd "./*" --type directory --max-depth 1 ${HOME}/tyl ${HOME}/wte ${HOME}/wte/dotfiles | fzf);
if [ -n "${folder}" ]; then
    cd ${folder}
fi
