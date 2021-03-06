#!/bin/bash -eux
echo "Removing development packages and cleaning up DNF data"
# yum -y remove gcc cpp gc kernel-devel kernel-headers glibc-devel glibc-headers kernel-devel kernel-headers make perl
# yum -y remove gc kernel-devel kernel-headers glibc-devel glibc-headers kernel-devel kernel-headers make perl
yum -y autoremove
yum -y clean all --enablerepo=\*

# Avoid 32 meg firmware package we don't need
echo "Removing extra packages"
yum -y remove linux-firmware

rm -f /tmp/chef*rpm

# delete any logs that have built up during the install
find /var/log/ -name *.log -exec rm -f {} \;
