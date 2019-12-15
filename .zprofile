source $HOME/.profile
[ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ] && exec startx
