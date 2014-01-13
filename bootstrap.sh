#!/bin/sh

echo "bootstrap.sh already done" ; exit 0


# if an argument is given, we git clone buildroot and use the argument
# as the commit where we want to go back in tree
if [ $# = 0 ]
then
    VERSION=2013.11
    NAME=buildroot-${VERSION}.tar.bz2
    URL=http://buildroot.uclibc.org/downloads/${NAME}

    wget ${URL} -O /tmp/${NAME}

    mkdir buildroot
    cd buildroot
    tar xvf /tmp/${NAME} -C . --strip 1
else
    git clone http://git.buildroot.net/git/buildroot.git buildroot
    cd buildroot
    git checkout $1
fi

# patch buildroot
for p in ../custom/patchs/*.patch
do
	patch < "$p"
done

for p in ../custom/patchs/git/*.patch
do
	git am "$p"
done

#back to root directory
cd ..

#gitignore
cat >> .gitignore <<EOF
/buildroot
/.gitignore
/bootstrap.sh
EOF

#dummyfy bootstrap.sh
sed -i '0,/####DO_NOT_TOUCH####/s//echo "bootstrap.sh already done" ; exit 0/g' ./bootstrap.sh
