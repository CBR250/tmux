#!/bin/bash
CURDIR=$PWD
PACKAGE=$CURDIR/PACKAGE
TARGET=$CURDIR/TARGET
Folder=$CURDIR/tmux

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

echo "************ tmux-2.0.tar.gz ***************************"
if [ ! -d "$TARGET/tmux-2.0" ]; then

	cd $PACKAGE
	tar xvf tmux-2.0.tar.gz -C $TARGET
		
	cd "$TARGET/tmux-2.0"

	echo "***************************************"
	CC=armeb-unknown-linux-uclibcgnueabi-gcc ./configure \
	--prefix=$Folder \
	--host=armeb-linux

	echo "***************************************"
	make
	echo "***************************************"
	make install
	cd $CURDIR
fi

