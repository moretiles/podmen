#!/bin/bash

if (( "$(id -u)" != 0 )); then
	echo I must be run as root
	exit 1
fi

podman generate systemd --new --after vault-pre.service --requires vault-pre.service vault
echo 'WAIT'
echo make sure to add under [Install]: WantedBy=vault.target
echo 'WAIT'
