#!/bin/bash

set -eu

if [[ "$(id -u)" != 0 ]]; then
    echo "Must be run as root" 1>&2
    exit 1
fi

name="${PWD%/*}"
name="${name##*/}"

echo "${name}"
#exit 0

tar cf ../live.tar ../live
#find ../live -type f | cpio -ov > ../live.tar
find ../live -type f -exec rm "{}" \;
chown dv:dv ../live.tar
sudo -u dv scp ../live.tar hostpi.home.arpa:/home/debian/podman/"${name}"/live.tar
sleep 1
sudo -u dv ssh hostpi.home.arpa "cd /home/debian/podman/${name}"'; sudo tar -pxf ./live.tar -C tmp; while IFS= read -r tmp_file; do live_file="${tmp_file/tmp\/live\//live\/}"; echo "${tmp_file}" "${live_file}"; sudo chown "$(stat -c "%u:%g" "${live_file}")" "${tmp_file}"; sudo mv "${tmp_file}" "${live_file}"; done <<< "$(find tmp/ -type f)"; sudo rm -r tmp/live live.tar'
#sudo -u dv ssh hostpi.home.arpa "cd /home/debian/podman/${name}"'; sudo tar -pxf ./live.tar -C tmp; while IFS= read -r tmp_file; do live_file="${tmp_file/tmp\/live\//live\/}"; echo "${tmp_file}" "${live_file}"; sudo echo "$(stat -c "%u:%g" "${live_file}")" "${live_file}"; done <<< "$(find tmp/ -type f)"; sudo rm live.tar'
#sudo -u dv ssh hostpi.home.arpa "cd /home/debian/podman/${name}; sudo tar --overwrite -xf ./live.tar; rm live.tar"
#sudo -u dv ssh hostpi.home.arpa "cd /home/debian/podman/${name}; sudo sudo tar --no-overwrite-dir -xf ./live.tar; rm live.tar"
#sudo -u dv ssh hostpi.home.arpa "cd /home/debian/podman/${name}/live; sudo cpio --no-preserve-owner -i < ../live.tar; rm ../live.tar"
