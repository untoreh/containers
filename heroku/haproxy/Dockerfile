FROM untoreh/containers:chisel-alp

RUN apk add --no-cache haproxy

ADD services.d /etc/services.d/

CMD ["/init"]
