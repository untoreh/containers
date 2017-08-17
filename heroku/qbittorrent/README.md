## qBittorrent container with volumes utilities

container based on [wernight/docker-qbittorrent](https://github.com/wernight/docker-qbittorrent) with added syncthing (with inotify) and sshfs, both are optional.

An endpoint is required because when the container starts it sets up tunnels to such endpoints, using the provided `$TN_PORTS` so that the qbt web interface can be accessed and/or a reverse proxy can be configured.

## Env vars
For endpoint ssh access:

- `EP_HOST`
- `EP_USR`
- `EP_PORT`
- `EP_KEY` (ppk!)

For services config:
- `QBTR_CONFIG` qbittorrent base64 encoded string
- `ST_CONFIG` syncthing base64 encoded string
- `TN_PORTS` comma separated list of ports for tunneling

For volumes:
- `SSHFS`, `SYNCTHING` set to 1 to enable them
- `SRC_PATH`, `DST_PATH` src is for the container, dst for the endpoint. Used by sshfs to setup a reverse mount on the endpoint.

## maybe
- directly proxy the web interfaces over chisel `--proxy` option. (But the current way is less privy)

