#!/usr/bin/bash
SHELL_PWD=$(dirname $0)
apt update
apt install -y gcc git binutils make perl mtools mkisofs syslinux liblzma-dev

rm -rf /opt/ipxe
pushd /opt
git clone http://192.168.13.80:3000/sleechengn/ipxe
pushd /opt/ipxe/src

cat > script.ipxe <<EOF
#!ipxe
dhcp
chain --autofree tftp://${next-server}/boot.ipxe
EOF

make bin-x86_64-efi/ipxe.efi EMBED=script.ipxe
make bin/undionly.kpxe EMBED=script.ipxe

