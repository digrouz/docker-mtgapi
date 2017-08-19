# docker-mtgapi
Install mtgapi into a Linux container

## Description

mtgapi is a small api to retrieve informations from mtgson

https://github.com/digrouz/mtgapi

## Usage
    docker create --name=mtgapi \
      -v /etc/localtime:/etc/localtime:ro \
      -e DOCKUID=<UID default:10022> \
      -e DOCKGID=<GID default:10022> \
      -p 6666:6666 \
      -p 6667:6667 \
      digrouz/docker-mtgapi
      
## Environment Variables

When you start the `mtgapi` image, you can adjust the configuration of the `mtgapi` instance by passing one or more environment variables on the `docker run` command line.

### `DOCKUID`

This variable is not mandatory and specifies the user id that will be set to run the application. It has default value `10022`.

### `DOCKGID`

This variable is not mandatory and specifies the group id that will be set to run the application. It has default value `10022`.

### `DOCKUPGRADE`

This variable is not mandatory and specifies if the container has to launch software update at startup or not. Valid values are `0` and `1`. It has default value `1`.


## Notes

* The docker entrypoint will upgrade operating system at each startup. To disable this feature, just add `-e DOCKUPGRADE=0` at container creation.
