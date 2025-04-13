#!/bin/bash

set -e

mkdir -p ../live
vault-templates ./templates
cp ./systemd.sh ../live
../../deploy.sh
#rm -rf ../live ../live.tar
