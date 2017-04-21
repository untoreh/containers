FROM alpine:latest

RUN apk upgrade --update && \
    rm -r /var/cache/apk/*

CMD ["/bin/busybox", "sh"]