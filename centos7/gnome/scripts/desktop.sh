#!/bin/sh -eux

#
# desktop
#
# yum -y install xorg-x11-server-Xorg gcc
# yum -y groupinstall gnome
yum groupinstall -y "GNOME Desktop" "Graphical Administration Tools"
yum -y install gdm

#
# set runlevel to 5, to boot to GDM
#
# sed --in-place -e 's/id:3:initdefault/id:5:initdefault/' /etc/inittab
systemctl set-default graphical.target
#
# configure GDM to automatically log in user vagrant
#
mv /tmp/custom.conf /etc/gdm/

#
# disable lockscreen and screensaver
#
sudo -u vagrant mkdir -p /home/vagrant/.config/gconf
sudo -u vagrant gconftool-2 --set /schemas/desktop/gnome/lockdown/disable_lock_screen --type boolean true
sudo -u vagrant gconftool-2 --set /schemas/apps/gnome-screensaver/lock_enabled --type boolean false
sudo -u vagrant gconftool-2 --set /schemas/apps/gnome-screensaver/idle_activation_enabled --type boolean false

# #
# # disable cursor blinking
# #
# sudo -u vagrant gconftool-2 --set /apps/gnome-terminal/profiles/Default/cursor_blink --type boolean false
sudo -u vagrant gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ cursor-blink-mode off

#
# add vagrant user to vboxsf group, for accessing shared folders
#
/usr/sbin/usermod -aG vboxsf vagrant

#
# start gnome-terminal on desktop login
#
sudo -u vagrant mkdir -p /home/vagrant/.config/autostart
sudo -u vagrant ln -s /usr/share/applications/gnome-terminal.desktop /home/vagrant/.config/autostart
