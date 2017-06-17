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
# add vagrant user to vboxsf group, for accessing shared folders
#
/usr/sbin/usermod -aG vboxsf vagrant

#
# start gnome-terminal on desktop login
#
sudo -u vagrant mkdir -p /home/vagrant/.config/autostart
sudo -u vagrant ln -s /usr/share/applications/gnome-terminal.desktop /home/vagrant/.config/autostart

#
# stage script to initialize gsettings
#
sudo -u vagrant cp /tmp/my-gsettings.sh /home/vagrant/
sudo -u vagrant cp /tmp/my-gsettings.desktop /home/vagrant/.config/autostart
