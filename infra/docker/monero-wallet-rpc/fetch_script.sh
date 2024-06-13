#!/bin/bash

tar_platform=""

case $1 in
    linux/amd64) tar_platform="linux-x64";;
    linux/arm64) tar_platform="linux-armv8";;
    linux/arm/v7) tar_platform="linux-armv7";;
    *) echo "Unsupported platform: $1" && exit 1 ;;
esac

gpg --keyserver keyserver.ubuntu.com --recv-keys 81AC591FE9C4B65C5806AFC3F0AF4D462A0BDF92
curl -O https://www.getmonero.org/downloads/hashes.txt
gpg_out=$(gpg --verify hashes.txt)

[[ $? != 0 ]] && echo -e "$gpg_out" && exit 2


tar_name=$(awk "/monero-$tar_platform/ {print \$2}" hashes.txt)
tar_hash=$(awk "/monero-$tar_platform/ {print \$1}" hashes.txt)

curl -O https://downloads.getmonero.org/cli/$tar_name

actual_hash=$(sha256sum $tar_name | awk '{print $1}')

[[ "$actual_hash" != "$tar_hash" ]] \
    && echo -e "The hash doesnt match.\nActual Hash: $actual_hash\nShould be: $tar_hash" && exit 3

dirname=$(tar -tf $tar_name | grep /monero-wallet-rpc | cut -d/ -f 1)

tar -xf $tar_name --strip-components=1 $dirname/monero-wallet-rpc
