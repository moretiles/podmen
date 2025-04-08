#!/bin/bash

set -eu

if (( "$(id -u)" != 0 )); then
	echo I must be run as root
	exit 1
fi

podman generate systemd --new --requires bind-eth_podman.service --after bind-eth_podman.service --after vault.target --requires vault.target --wants --requires registry_podman.service --after registry_podman.service vault-certificate@docker_auth.timer docker_auth
echo 'WAIT
echo 'Make sure to activate vault-certificate@docker_auth.timer'
echo 'WAIT
