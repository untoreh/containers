#!/bin/sh

ln -s /home/qbittorrent/.config $HOME || ln -s /home/qbittorrent/.config/* $HOME/.config

if [ ! -z "$QBTR_CONFIG" ]; then
	echo "$QBTR_CONFIG" | base64 -d > /config/qBittorrent.conf
fi

if [ ! -z "$ST_CONFIG" ]; then
	echo "$ST_CONFIG" | base64 -d > /stconfig/config.xml
fi
