FROM alpine:latest

COPY repositories etc/apk/repositories

RUN apk upgrade --update && \
    rm -r /var/cache/apk/*

CMD ["/bin/busybox", "sh"]
