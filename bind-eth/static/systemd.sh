#!/bin/bash

if (( "$(id -u)" != 0 )); then
	echo I must be run as root
	exit 1
fi

podman generate systemd --new bind-eth
