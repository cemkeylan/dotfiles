#!/bin/sh
. $HOME/.profile
. $HOME/.config/xkeymap
setxkbmap $KEYMAP
xcompmgr -C &
nightmodetoggle disable &
powercheck &
# Launch Bar
slstatus &
numlockx on
mpd >/dev/null 2>&1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
xautolock -time 10 -locker '~/.local/bin/lockme' &
startdwm
