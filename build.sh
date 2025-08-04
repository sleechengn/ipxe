#!/usr/bin/bash
echo "$(dirname $0)"
apt update
apt install -y gcc git binutils make perl mtools mkisofs syslinux liblzma-dev
git submodule update --init
pushd $(dirname $0)/ipxe/src

cat > script.ipxe <<EOF
#!ipxe
dhcp
chain --autofree tftp://${next-server}/boot.ipxe
EOF

make bin-x86_64-efi/ipxe.efi EMBED=script.ipxe
make bin/undionly.kpxe EMBED=script.ipxe

popd
