#!/usr/bin/env bash

choice=$(printf '%s\n' Beats Disconnect | wofi --show=dmenu)

if [ -z $choice ]; then
    return 0;
fi

if [ $choice = "Beats" ]; then
    bluetoothctl connect F8:66:5A:31:84:6D;
else
    bluetoothctl disconnect;
fi
