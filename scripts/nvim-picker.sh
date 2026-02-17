#! /usr/bin/env bash

day=$(date +%d)
if (( day % 2 == 0 )); then
    nvim $@
else
    vim $@ || vimx $@
fi
