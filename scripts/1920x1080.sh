#!/usr/bin/env bash

echo "Xft.dpi: 96" > ${HOME}/.Xresources
xrdb -merge ~/.Xresources
xrandr --output DisplayPort-2 --mode 1920x1080
i3-msg restart
