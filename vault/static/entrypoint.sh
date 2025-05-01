#!/bin/sh

set -e

cd "$(mktemp -d)"
chmod 700 .
export HOME="$(readlink -f .)"
vault server -config=/vault/config
