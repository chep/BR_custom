#!/bin/sh

####DO_NOT_TOUCH####

VERSION=2013.08
NAME=buildroot-${VERSION}.tar.bz2
URL=http://buildroot.uclibc.org/downloads/${NAME}

wget ${URL} -O /tmp/${NAME}

tar xvf /tmp/${NAME} -C . --strip 1

cat >> .gitignore <<EOF
/arch
/Config.in
/COPYING
/linux
/package
/toolchain
/board
/Config.in.legacy
/docs
/Makefile
/support
/boot
/CHANGES
/configs
/fs
/Makefile.legacy
/system
/.defconfig
/.gitignore
/bootstrap.sh
EOF

# patch buildroot
for p in custom/patchs/*.patch
do
	patch < $p
done

sed -i '0,/####DO_NOT_TOUCH####/s//echo "bootstrap.sh already done" ; exit 0/g' ./bootstrap.sh
