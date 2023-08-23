# FiveM Docker Server ⚙️ WIP

This image provides a FiveM/txAdmin server. After the first startup, it downloads the defined version from the CFX servers. If there is an update to the server files, simply recreate the container without having to download the image again. Everything will be downloaded again (only new) and you can continue.
## Content🧾

* [Deployment👩‍💻](https://github.com/Auhrus/fivem-docker-server#deployment)
* [IMPORTANT‼️](https://github.com/Auhrus/fivem-docker-server#important%EF%B8%8F)
* [Environment Variables🔢](https://github.com/Auhrus/fivem-docker-server#environment-variables)
* [Update/Downgrade⏫](https://github.com/Auhrus/fivem-docker-server#up-downgrade)
* [Support❤️](https://github.com/Auhrus/fivem-docker-server#support)

## Deployment👩‍💻

How to install this Docker Container

1. Install Docker on your Server. [[Here]](https://duckduckgo.com/?t=ffab&q=How+to+install+Docker+on+Ubuntu) you can find a guide.
2. Run that command
```bash
docker run -d -t --name CONAINER_NAME -p 30120:30120/tcp -p 40120:40120/tcp -p 30120:30120/udp -e download=VERSION -v VOLUME_NAME:/opt/fivem/txData ghcr.io/auhrus/fivem:latest
```
Please replace all things written in CAPS.

3. After all data has been downloaded, the server will be get started.

4. Next, the txAdmin server must be set up. This is done via the web interface provided by FiveM.
[Point2](https://docs.fivem.net/docs/server-manual/setting-up-a-server-txadmin/#start-the-server)

## IMPORTANT‼️



## Environment Variables🔢

To run this project, you will need to set the following environment variables.

| Variable      | Function      | Default |
|:-------------:|:-------------:|:-------------|
| `download`    |With this variable you can determine which version of the FiveM server will be downloaded.<br>Below you will find a more detailed description of this variable.|recommended|
| `PATH`    |You can ignore this, it will be created automatically by the Alpine base.|/usr/local/sbin:/usr/local/bin:<br>/usr/sbin:/usr/bin:/sbin:/bin|

Detailed description of the download variable:

Detailed description
<br>![alt text for screen readers](https://docs.fivem.net/server-setup/windows-step-2.png "Text to show on mouseover")<br>
temp


<br>
Server start script:

```bash
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
	
exec $SCRIPTPATH/alpine/opt/cfx-server/ld-musl-x86_64.so.1 \
--library-path "$SCRIPTPATH/alpine/usr/lib/v8/:$SCRIPTPATH/alpine/lib/:$SCRIPTPATH/alpine/usr/lib/" -- \
$SCRIPTPATH/alpine/opt/cfx-server/FXServer +set citizen_dir $SCRIPTPATH/alpine/opt/cfx-server/citizen/ $*
```


## Up-/Downgrade⏫

How do i change the version of my FiveM Server?

1. First stop and remove the existing Container.
```bash
docker stop CONAINER_NAME && docker rm CONAINER_NAME
```
2. Then create him again like in the [Deployment👩‍💻](https://github.com/Auhrus/fivem-docker-server#deployment) with the same Volumes.

Please note that downgrading may cause compatibility problems e.g. with the txAdmin database.


## Support❤️

If you find any bugs have improvements for this Documentation or have any other suggestions/improvements, please post a bug report or feature suggestion in the 
[Issues Tab](https://github.com/Auhrus/fivem-docker-server/issues).
