#!/bin/sh -eux

cp /tmp/google-chrome.repo /etc/yum.repos.d

#
# https://www.tecmint.com/install-google-chrome-on-redhat-centos-fedora-linux/
#

yum install -y google-chrome-stable firefox
