#!/usr/bin/env bash

#
# disable screensaver and lock
#
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false

#
# disable cursor blinking
#
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ cursor-blink-mode off

rm -f ~/.config/autostart/my-gsettings.desktop
