#!/usr/bin/env bash

gnome-settings-daemon & # handles themes, starts gnome-screensaver. You may have to use gconf to disable it setting the background.
nm-applet &             # assuming you're using Network Manager
gnome-power-manager &   # for laptops and stuff
gnome-volume-control-applet &  # for volume control
conky &                 # start conky system monitor
exec /usr/bin/awesome   # awesome receives xinit's process id; when it terminates, X will be terminated
