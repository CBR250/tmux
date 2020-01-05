#!/bin/bash
CURDIR=$PWD
PACKAGE=$CURDIR/PACKAGE
TARGET=$CURDIR/TARGET
Folder=$CURDIR/TMUX

if [ ! -d "$PACKAGE" ]; then
	mkdir $PACKAGE
fi

if [ ! -d "$TARGET" ]; then
	mkdir $TARGET
fi

if [ ! -d "$UsbModeswitchOBJ" ]; then
	mkdir $UsbModeswitchOBJ
fi

#  Example:
#  echo "************ libusb-1.0.9.tar.bz2 ***************************"
#  if [ ! -d "$TARGET/libusb-1.0.9" ]; then
#  	if [ ! -f $PACKAGE/libusb-1.0.9.tar.bz2 ]; then
#  		cd $PACKAGE
#  		wget "http://sourceforge.net/projects/libusb/files/libusb-1.0/libusb-1.0.9/libusb-1.0.9.tar.bz2"
#  	fi	
#  
#  	cd $PACKAGE
#  	tar xvf libusb-1.0.9.tar.bz2 -C $TARGET
#  		
#  	cd "$TARGET/libusb-1.0.9"
#  
#  	echo "***************************************"
#  	CC=armeb-unknown-linux-uclibcgnueabi-gcc ./configure \
#  	--prefix=$UsbModeswitchOBJ \
#  	--host=armeb-linux
#  
#  	echo "***************************************"
#  	make
#  	echo "***************************************"
#  	make install
#  	cd $CURDIR
#  fi

echo "************ ncurses-5.9.tgz ***************************"
if [ ! -d "$TARGET/ncurses-5.9" ]; then

	cd $PACKAGE
	tar xvf ncurses-5.9.tar.gz -C $TARGET
		
	cd "$TARGET/ncurses-5.9"

	echo "***************************************"
	CC=gcc ./configure \
	--prefix=$Folder \
	--host=armeb-linux

	echo "***************************************"
	make
	echo "***************************************"
	make install
	cd $CURDIR
fi

echo "************ libevent-2.0.20-stable.tar.gz ***************************"
if [ ! -d "$TARGET/libevent-2.0.20-stable" ]; then

	cd $PACKAGE
	tar xvf libevent-2.0.20-stable.tar.gz -C $TARGET
		
	cd "$TARGET/libevent-2.0.20-stable"

	echo "***************************************"
	CC=gcc ./configure \
	--prefix=$Folder \
	--host=armeb-linux

	echo "***************************************"
	make
	echo "***************************************"
	make install
	cd $CURDIR
fi

echo "************ tmux-2.0.tar.gz ***************************"
if [ ! -d "$TARGET/tmux-2.0" ]; then

	cd $PACKAGE
	tar xvf tmux-2.0.tar.gz -C $TARGET
		
	cd "$TARGET/tmux-2.0"

	echo "***************************************"
	CC=gcc ./configure \
	--prefix=$Folder \
        LDFLAGS=-L$Folder/lib/ \
        CFLAGS="-I$Folder/include/ -I$Folder/include/ncurses/" \
	--host=armeb-linux

	echo "***************************************"
	make
	echo "***************************************"
	make install
	cd $CURDIR
fi

# Reference :
# http://pyther.net/2014/03/building-tmux-1-9a-statically/

