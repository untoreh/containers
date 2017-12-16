#!/bin/sh

## workaround around mounts taking too much time
while ! mkdir -p /run/s6; do sleep 1; done

exec /init
