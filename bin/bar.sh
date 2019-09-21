#!/bin/sh

# VARIABLES
ETHERNET="eno1"
WIRELESS="wlo1"
# enter your wireless or wired device names e.g. eth0 wlp2s0

getip() { \
	IP="$(ip a show $1 | grep 'inet ' | cut -d: -f2 | awk '{print $2}')"
	[ -z "$IP" ] && IP="N/A"
	IP="$1 ${IP}"
	printf "$IP\n"
}
network() { \
	WIP="$(getip $WIRELESS)"
	EIP="$(getip $ETHERNET)"
	SSID="$(iwgetid -r)"
	printf "| NET $EIP $SSID $WIP |"
}

NM=`nightmodecheck`
HOMESIZE=`df -h | grep '/home$' | awk '{print $3}' | sed s/G//`/`df -h | grep '/home$' | awk '{print $2}' | sed s/G/\ GB/`
ROOTSIZE=`df -h | grep '/$' | awk '{print $3}' | sed s/G//`/`df -h | grep '/$' | awk '{print $2}' | sed s/G/\ GB/`
BAT=`cat /sys/class/power_supply/BAT?/capacity`
BATSTATUS=`cat /sys/class/power_supply/BAT?/status`
[ "$BATSTATUS" = "Unknown" ] && BATSTATUS=""
MPDCP="`mpc current`"
HOST=`cat /etc/hostname`
[ -n "$MPDCP" ] && MPDCP="| Now Playing: $MPDCP "
VOL="$(pamixer --get-volume-human)"



xsetroot -name " $USER@$HOST $MPDCP| NM:$NM | /HOME:$HOMESIZE /:$ROOTSIZE `network` VOL: $VOL | BAT:$BAT% $BATSTATUS | `date +%a\ %e\ %b\ %Y\ %H:%M`"
