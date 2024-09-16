#!/bin/sh
# set display dpi based on resolution
res="$(xrandr | awk '/\*/ {print $1}')"
W="$(echo $res | awk -F "x" '{print $1}')"
H="$(echo $res | awk -F "x" '{print $2}')"
my_dpi=$((${H}*96/768))
#my_dpi="96"
primary="$(xrandr | egrep " connected primary " | cut -d' ' -f1)"
xrandr --output ${primary} --scale-from ${res} --panning ${res} --fb ${res} --dpi ${my_dpi}

# write dpi to other files
[ -f ~/.Xresources ] && sed -i "s|^Xft.dpi.*|Xft.dpi       : ${my_dpi}|g" ~/.Xresources
[ -f ~/.Xresources ] && xrdb -merge -I $HOME ~/.Xresources
[ -f ~/.profile ] && sed -i "s|^my_dpi=.*|my_dpi=${my_dpi}|g" ~/.profile
[ -f ~/.config/rofi/config.rasi ] && sed -i "s|dpi:.*|dpi: ${my_dpi};|g" ~/.config/rofi/config.rasi
sudo cp -rf $HOME/.config/rofi /root/.config/

xset r rate 250 45
xset s noblank
xset s off
xset -dpms

# xfce settings daemon
xfsettingsd &

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
