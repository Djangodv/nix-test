#!/usr/bin/env bash

readarray -t lines < <(lsblk --nodeps --output name,size,type,mountpoints)

# TODO: Add newlines in script correctly
PS3="
Select main storage device (1/$((${#lines[@]}-1))): "

echo "   ${lines[0]}"
select choice in "${lines[@]:1}"; do
    echo "Selected /dev/${choice:0:3}
    "
    break
done

read -r identifier _ _ <<<"$choice"
storage_device="/dev/${identifier}"

git clone -b development --single-branch https://github.com/Djangodv/nixos.git /tmp/etc/nixos/

# read -r id sn 

# lsblk
# echo -n "Enter storage device identifier (from NAME column): "
# echo -n "Choose storage device: "
# lsblk --nodeps --output name,size,type,mountpoints
# echo -n "Enter kernel device name (such as )"
# IFS=$'\n' read -d '' -ra lines < <(lsblk --nodeps -no name,serial,size | grep "sd")

# sudo vim /tmp/etc/nixos/nixos/disko-config.nix
