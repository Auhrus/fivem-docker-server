#!/bin/bash
CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
  echo "***Downloading FiveM Server"
  wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/
	case $download in
		"recommended")
			download=$(awk -F '"' 'NR==15 {gsub(/"/, "", $2); print $2}' /opt/fivem/index.html)
			echo "**Installing recommended" $download
			wget -O- https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/$download | tar -xJ -C /opt/fivem
		;;
		"optional")
		  download=$(awk -F '"' 'NR==19 {gsub(/"/, "", $2); print $2}' /opt/fivem/index.html)
			echo "**Installing optional" $download
			wget -O- https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/$download | tar -xJ -C /opt/fivem
		;;
		*)
			echo "**Installing from" $download
			wget -O- $download | tar -xJ -C /opt/fivem
		;;
  esac
	rm index.html
  touch $CONTAINER_ALREADY_STARTED
else
  echo "***Starting FiveM Server"
	SCRIPT=$(readlink -f "$0")
	SCRIPTPATH=$(dirname "$SCRIPT")
	
	exec $SCRIPTPATH/alpine/opt/cfx-server/ld-musl-x86_64.so.1 \
  --library-path "$SCRIPTPATH/alpine/usr/lib/v8/:$SCRIPTPATH/alpine/lib/:$SCRIPTPATH/alpine/usr/lib/" -- \
  $SCRIPTPATH/alpine/opt/cfx-server/FXServer +set citizen_dir $SCRIPTPATH/alpine/opt/cfx-server/citizen/ $*
  fi
exit
