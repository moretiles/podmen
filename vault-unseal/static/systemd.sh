#!/bin/bash

if (( "$(id -u)" != 0 )); then
	echo I must be run as root
	exit 1
fi

podman generate systemd --new --requires vault_podman.service --requires bind-eth_podman.service --after vault_podman.service --after bind-eth_podman.service vault-unseal
echo 'WAIT'
echo make sure to add under [Install]: WantedBy=vault.target
echo 'WAIT'
