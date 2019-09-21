#!/bin/sh
compton &
/home/cem/bin/nightmodetoggle disable &
powercheck &
# Launch Bar
while true :
do
	bar.sh
	sleep 0.1
done &
numlockx on
mpd >/dev/null 2>&1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
xautolock -time 10 -locker '~/bin/lockme' &
startdwm
