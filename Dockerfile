FROM alpine:latest

RUN cat <<EOF > etc/apk/repositories
http://dl-cdn.alpinelinux.org/alpine/latest-stable/main
http://dl-cdn.alpinelinux.org/alpine/latest-stable/community
http://dl-cdn.alpinelinux.org/alpine/edge/testing
EOF
 && apk update && apk upgrade
 && rm -r /var/cache/apk/*

CMD ["/bin/busybox", "sh"]