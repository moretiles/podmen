#!/bin/bash

if (( "$(id -u)" != 0 )); then
	echo I must be run as root 1>&2
	exit 1
fi

mkdir -p ../live
vault-templates ./templates
cp named.conf.authoritative ../live/fs/etc/bind/named.conf.authoritative
cp ./systemd.sh ../live
chown -R dv:dv ../live
sudo -u dv ../../deploy.sh
rm -rf ../live ../live.tar
