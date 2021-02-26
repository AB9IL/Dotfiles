#!/bin/sh

# networking applet
exec nm-applet &

# use compton compositor
exec picom --config ~/.config/picom/picom.conf &

# MATE panel, settings, power manager, nm-applet
#exec mate-panel
#exec mate-session
exec mate-power-manager &
exec xdg-user-dirs-update &
exec mate-settings-daemon &

# start the window manager
# if not started by the greeter
exec i3
