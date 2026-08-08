# FiveM Docker Server 🦺

This image provides a FiveM/txAdmin server. After the first startup, it downloads the defined version from the CFX servers. If there is an update to the server files, simply recreate the container without having to redownload the image again. Everything will be downloaded again (only new) and you can continue.

## Content🧾

* [Important‼️](https://github.com/Auhrus/fivem-docker-server?tab=readme-ov-file#important)
* [Deployment👩‍💻](https://github.com/Auhrus/fivem-docker-server?tab=readme-ov-file#deployment)
* [Environment Variables🔢](https://github.com/Auhrus/fivem-docker-server?tab=readme-ov-file#environment-variables)
* [Update/Downgrade⏫](https://github.com/Auhrus/fivem-docker-server?tab=readme-ov-file#up-downgrade)
* [Official Documentation📖](https://github.com/Auhrus/fivem-docker-server?tab=readme-ov-file#official-documentation)
* [Support❤️](https://github.com/Auhrus/fivem-docker-server?tab=readme-ov-file#support%EF%B8%8F)

## Important‼️

- Make sure that the folder of the volumes have the owner and group 1001:1001.
- If you're running a FiveM Enhanced server, you must run the container in `--privileged` mode.

## Deployment👩‍💻

How to install this Docker Container

1. Install Docker on your Server. [[Here]](https://duckduckgo.com/?t=ffab&q=How+to+install+Docker+on+Ubuntu) you can find a guide.
2. Run that command:

```bash
docker run -d --name CONAINER_NAME (--privileged) -p 40120:40120/tcp -p 30120:30120/tcp -p 30120:30120/udp -e gtaversion=GAMEVERSION -e legacydownload=SERVERVERSION -v VOLUME_NAME:/opt/fivem/txData ghcr.io/auhrus/fivem:latest
```

Please replace all things written in CAPS.

3. After all data has been downloaded, the txAdmin server will start.
4. Now the txAdmin server must be set up. This is done via the web interface provided by FiveM.<br />[[Here]](https://docs.fivem.net/docs/server-manual/setting-up-a-server-txadmin/#start-the-server) you can read from point 2 on, how to set up txAdmin. (The PIN can be found in the server console/log)
5. After that the FiveM server will be started and you can play.

## Environment Variables🔢

To run this container, you will need to set the following environment variables.

|     Variable |                                                                                         Function  | Default                                                            |
|:----------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|--------------------------------------------------------------------|
|   `gtaversion` | This variable allows you to switch between the "Legacy FiveM" and "FiveM for Enhanced" Version.<br />Variable=`legacy` or `enhanced`                                                      | legacy                                                             |
| `legacydownload` | With this variable you can determine which version of the Legacy FiveM server will be downloaded.<br />Below you will find a more detailed description of this variable.                  | recommended                                                        |
|      `PATH` |                                                         You can ignore this, it will be created automatically by the Alpine base. | /usr/local/sbin:/usr/local/bin:<br />/usr/sbin:/usr/bin:/sbin:/bin |
|       `TZ` | This can be used to set the time zone within the container. Enter a [TZ identifier](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List) for this. When unset its UTC time. | \--                                                                |

#### Detailed description of the `legacydownload` variable (Only works if `gtaversion` is legacy)

There are 3 ways to use the variable.

1. Set it to 'recommended'<br />
   In that case, the version that can be downloaded at the time of container creation via the "Latest Recommended" button. Seen in the picture below.
2. Set it to 'optional'<br />
   In that case, the version that can be downloaded at the time of container creation via the "Latest Optional" button. Seen in the picture below.
3. or insert a link of the desired version<br />
   If you need a specific version of the server, you can also insert the direct link to the desired version file. The link will look like this e.g.

```html
https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/6622-d24291cd0e6119311f5b410be6167f6ccdc3e62d/fx.tar.xz
```

All versions can be found [->HERE](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/)

![image](https://github.com/Auhrus/fivem-docker-server/assets/57270834/8752e275-54ca-4ba7-a141-473bc0be4d70 "CFX artifacts")

## Up-/Downgrade⏫

How do i change the version of my FiveM Server?

1. First stop and remove the existing Container.

```shell
docker stop CONAINER_NAME && docker rm CONAINER_NAME
```

2. Then create him again like in the [Deployment👩‍💻](https://github.com/Auhrus/fivem-docker-server?tab=readme-ov-file#deployment) with the same Volumes.

## Official Documentation📖

Here you can find the Official FiveM/cfx Documentation:
[Complete FiveM/cfx Documentation](https://docs.fivem.net/docs/)

## Support❤️

If you find any bugs have improvements for this Documentation or have any other suggestions/improvements, please post a bug report or feature suggestion in the [Issues Tab](https://github.com/Auhrus/fivem-docker-server/issues).