#! /usr/bin/env bash

folder=$(fd "./*" --type directory --max-depth 1 ${HOME}/tyl ${HOME}/wte | fzf);
if [ -n "${folder}" ]; then
    cd ${folder} && zsh
fi
