#!/bin/sh -eux

#
# install, enable docker
#

yum install -y docker
systemctl enable docker

#
# create docker group, add vagrant user to docker group
#
groupadd docker
usermod -aG docker vagrant
