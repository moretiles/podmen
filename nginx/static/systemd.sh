#!/bin/bash

set -eu

if (( "$(id -u)" != 0 )); then
	echo I must be run as root
	exit 1
fi

podman generate systemd --new --after bind-eth_podman.service --requires bind-eth_podman.service nginx
