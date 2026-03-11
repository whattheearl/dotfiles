#!/usr/bin/env bash

sink=$(pactl list sinks short | awk '{print $2}' | fzf --prompt="Select Sink: " --height=40% --reverse)

[ -z "$sink" ] && exit 0

pactl set-default-sink "$sink"
echo "Default sink set to: $sink"
