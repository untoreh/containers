#!/bin/sh

if [ ! -z "$QBTR_CONFIG" ]; then
	echo "$QBTR_CONFIG" | base64 -d > /config/qBittorrent.conf
fi
