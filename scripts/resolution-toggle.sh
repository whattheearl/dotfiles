#! /usr/bin/env bash

xrandr | head -1 | grep "current 3840" \
    && $HOME/wte/dotfiles/scripts/1920x1080.sh \
    || $HOME/wte/dotfiles/scripts/3840x2160.sh
