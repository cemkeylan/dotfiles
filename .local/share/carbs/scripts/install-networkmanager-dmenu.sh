#!/bin/sh

out() { printf "$1\\n" ;}
error() { out "ERROR: $1" ;} >&2
die() { error "$1"; exit 1;}

CURRENT="$(pwd)"

gitlocation="$(mktemp -d)"
out "Installing pinentry-dmenu and py3-gobject"
yay -Sy --needed python-gobject pinentry-dmenu >/dev/null 2>&1 || die "Could not install dependencies"
out "Cloning git repository"
git clone https://github.com/firecat53/networkmanager-dmenu "$gitlocation" || die "Could not clone git repository"
out "Copying networkmanager_dmenu to local scripts"
cp "$gitlocation/networkmanager_dmenu" "$HOME/.local/bin" || die "Could not copy script"
out "Creating directory for configuration"
mkdir -p "$HOME/.config/networkmanager-dmenu" || die "Could not create directory for configuration file"
cat >"$HOME/.config/networkmanager-dmenu/config.ini" <<EOF
[dmenu]
#fn = -*-terminus-medium-*-*-*-16-*-*-*-*-*-*-*
dmenu_command = /usr/local/bin/dmenu -c
# # Note that dmenu_command can contain arguments as well like \`rofi -width 30\`
# # Rofi and dmenu are set to case insensitive by default \`-i\`
# l = number of lines to display, defaults to number of total network options
# fn = font string
# nb = normal background (name, #RGB, or #RRGGBB)
# nf = normal foreground
# sb = selected background
# sf = selected foreground
# b =  (just set to empty value and menu will appear at the bottom
# m = number of monitor to display on
# p = Custom Prompt for the networks menu
pinentry = /bin/pinentry-dmenu
# rofi_highlight = <True or False> # (Default: False) use rofi highlighting instead of '**'
# compact = <True or False> # (Default: False). Remove extra spacing from display

# # override normal foreground and background colors (dmenu) or use the
# # -password option (rofi) to obscure passphrase entry
# [dmenu_passphrase]
# dmenu_command = /usr/local/bin/dmenu -P
# nf = #222222
# nb = #222222
# rofi_obscure = True

[editor]
terminal = st
gui_if_available = False
# terminal = <name of terminal program>
# gui_if_available = <True or False>
EOF

cd "$CURRENT" || return 1
exit 0
