#!/bin/bash

set -eu

if (( "$(id -u)" != 0 )); then
	echo I must be run as root
	exit 1
fi

podman generate systemd --new --requires bind-eth_podman.service --after bind-eth_podman.service --after vault.target --requires vault.target --requires docker_auth_podman.service --after docker_auth_podman.service --wants vault-certificate@registry_podman.timer registry
echo 'WAIT
echo 'Make sure to activate vault-certificate@registry_podman.timer'
echo 'WAIT
