#!/usr/bin/env bash

echo "Xft.dpi: 192" > ${HOME}/.Xresources
xrdb -merge ~/.Xresources
xrandr --output DisplayPort-2 --mode 3840x2160
