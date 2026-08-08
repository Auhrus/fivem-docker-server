#!/bin/sh
CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
	echo "***Downloading FiveM Server" $gtaversion
	
	if [ "$gtaversion" == "legacy" ]; then
		wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/
		case $legacydownload in
			"recommended")
			echo "**Installing recommended" $download
			download=$(awk -F '"' 'NR==15 {gsub(/"/, "", $2); print $2}' /opt/fivem/index.html)
			wget -O- https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/$download | tar -xJ -C /opt
		;;
		
		"optional")
			echo "**Installing optional" $download
			download=$(awk -F '"' 'NR==19 {gsub(/"/, "", $2); print $2}' /opt/fivem/index.html)
			wget -O- https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/$download | tar -xJ -C /opt
		;;
		
		*)
			echo "**Installing from" $legacydownload
			wget -O- $legacydownload | tar -xJ -C /opt
		;;
		
		esac
		rm index.html
	fi
	
	
	if [ "$gtaversion" == "enhanced" ]; then
		echo "***Downloading enhanced"
		download=$(curl -sL "https://docs.fivem.net/docs/server-download/?platform=enhanced&os=linux" | sed -n 's/.*\(https:\/\/downloads\.cfx-services\.net\/prod\/[^"]*cfx-server_linux_x64\.tar\.xz\).*/\1/p' | head -n1)
		wget -O- $download | tar -xJ -C /opt
	fi
	touch $CONTAINER_ALREADY_STARTED
fi


echo "***Starting FiveM Server"
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

if [ "$gtaversion" == "legacy" ]; then
	exec $SCRIPTPATH/alpine/opt/cfx-server/ld-musl-x86_64.so.1 \
	--library-path "$SCRIPTPATH/alpine/usr/lib/v8/:$SCRIPTPATH/alpine/lib/:$SCRIPTPATH/alpine/usr/lib/" -- \
	$SCRIPTPATH/alpine/opt/cfx-server/FXServer +set citizen_dir $SCRIPTPATH/alpine/opt/cfx-server/citizen/ $*
	exit
fi

if [ "$gtaversion" == "enhanced" ]; then
	exec $SCRIPTPATH/alpine/lib/ld-musl-x86_64.so.1 \
	--library-path "$SCRIPTPATH/alpine/lib/:$SCRIPTPATH/alpine/usr/lib/" -- \
	$SCRIPTPATH/alpine/opt/cfx-server/cfx-server +set citizen_dir $SCRIPTPATH/alpine/opt/cfx-server/citizen/ $*
	exit
fi