#!/bin/sh

xset s noblank
xset s off
xset -dpms

# xfce settings daemon
[ -z "$(pgrep xfsettingsd)" ] && xfsettingsd &

# fix the slow loading XDG app problem
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# accomplish autostarts
xdg-user-dirs-update
xdg-user-dirs-update --force

# compositor
[ -z "$(pgrep picom)" ] && picom &

# hot key daemon
[ -z "$(pgrep sxhkd)" ] && sxhkd &

# background wallpaper
feh --no-fehbg --bg-scale /usr/share/backgrounds/wallpaper.png &

# start the window manager and status bar
while type dwm >/dev/null; do /usr/local/src/dwm-bar/dwm_bar.sh & dwm && continue || break; done
