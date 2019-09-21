source $HOME/.profile
which systemctl >/dev/null && if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi 
