cmd="$(echo -e "shutdown\nreboot\nlock" | fzf)"
echo $cmd

case "$cmd" in
    "shutdown")
        shutdown now
        ;;
    "reboot")
        shutdown -r now
        ;;
    "lock")
        i3lock --color 000000
        ;;
esac
