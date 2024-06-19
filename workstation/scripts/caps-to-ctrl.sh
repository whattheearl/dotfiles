#!/bin/bash
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
setxkbmap -option caps:ctrl_modifier 
