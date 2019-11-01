#!/bin/sh

. $HOME/.profile
. $HOME/.config/xkeymap
setxkbmap $KEYMAP
xcompmgr -C &
nightmodetoggle disable &
powercheck &
slstatus &
[ -e $HOME/.lastresource ] && xrdb "$(cat $HOME/.lastresource)" || xrdb $HOME/.local/share/xresource-themes/dark/dracula
unclutter &
numlockx on &
mpd >/dev/null 2>&1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
xautolock -time 10 -locker '~/.local/bin/lockme' &
[ -e $HOME/.custom.sh ] && $HOME/.custom.sh &
nlr &
sxhkd &
startdwm
