choice=$(printf '%s\n' 3840x2160 1920x1080 | wofi --show=dmenu)

if [ $choice = "3840x2160" ]; then
    swaymsg output DP-3 pos 0 0 res 3840x2160 scale 2
else
    swaymsg output DP-3 pos 0 0 res 1920x1080 scale 1
fi
