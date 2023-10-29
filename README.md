# FiveM Docker Server 🦺

This image provides a FiveM/txAdmin server. After the first startup, it downloads the defined version from the CFX servers. If there is an update to the server files, simply recreate the container without having to redownload the image again. Everything will be downloaded again (only new) and you can continue.
## Content🧾

* [Deployment👩‍💻](https://github.com/Auhrus/fivem-docker-server?tab=readme-ov-file#deployment)
* [Environment Variables🔢](https://github.com/Auhrus/fivem-docker-server?tab=readme-ov-file#environment-variables)
* [Update/Downgrade⏫](https://github.com/Auhrus/fivem-docker-server?tab=readme-ov-file#up-downgrade)
* [Support❤️](https://github.com/Auhrus/fivem-docker-server?tab=readme-ov-file#support%EF%B8%8F)


## Deployment👩‍💻

How to install this Docker Container

1. Install Docker on your Server. [[Here]](https://duckduckgo.com/?t=ffab&q=How+to+install+Docker+on+Ubuntu) you can find a guide.
2. Run that command
```bash
docker run -d -t --name CONAINER_NAME -p 40120:40120/tcp -p 30120:30120/tcp -p 30120:30120/udp -e download=VERSION -v VOLUME_NAME:/opt/fivem/txData ghcr.io/auhrus/fivem:latest
```
Please replace all things written in CAPS.

3. After all data has been downloaded, the Container will be get stopped.

4. Restart the container and the txAdmin server will start.

5. Now the txAdmin server must be set up. This is done via the web interface provided by FiveM.<br>
   [[Here]](https://docs.fivem.net/docs/server-manual/setting-up-a-server-txadmin/#start-the-server) you can read from point 2 on, how to set up txAdmin. (The PIN can be found in the server console)

6. After that the FiveM server will be started and you can play.


## Environment Variables🔢

To run this container, you will need to set the following environment variables.

| Variable      | Function      | Default |
|:-------------:|:-------------:|:-------------|
| `download`    |With this variable you can determine which version of the FiveM server will be downloaded.<br>Below you will find a more detailed description of this variable.|recommended|
| `PATH`    |You can ignore this, it will be created automatically by the Alpine base.|/usr/local/sbin:/usr/local/bin:<br>/usr/sbin:/usr/bin:/sbin:/bin|


#### Detailed description of the `download` variable
There are 3 ways to use the variable.<br>
1. Set it to 'recommended'<br>
	In that case, the version that can be downloaded at the time of container creation via the "Latest Recommended" button. Seen in the picture below.<br>
 
2. Set it to 'optional'<br>
	In that case, the version that can be downloaded at the time of container creation via the "Latest Optional" button. Seen in the picture below.<br>
 
3. or insert a link of the desired version<br>
   	If you need a specific version of the server, you can also insert the direct link to the desired version file. The link will look like this e.g.<br>
    
```html
https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/6622-d24291cd0e6119311f5b410be6167f6ccdc3e62d/fx.tar.xz
```
All versions can be found [->HERE](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/)<br>
 
![image](https://github.com/Auhrus/fivem-docker-server/assets/57270834/8752e275-54ca-4ba7-a141-473bc0be4d70 "CFX artifacts")

<br><br>
How the server get started:

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

**Please note** that downgrading may cause compatibility problems e.g. with the txAdmin database.


## Support❤️

If you find any bugs have improvements for this Documentation or have any other suggestions/improvements, please post a bug report or feature suggestion in the 
[Issues Tab](https://github.com/Auhrus/fivem-docker-server/issues).
