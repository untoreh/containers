FROM ubuntu:rolling

ENV S6v=v1.19.1.1

RUN apt update && apt install -yq curl ca-certificates && \
  curl -sOL https://github.com/just-containers/s6-overlay/releases/download/${S6v}/s6-overlay-amd64.tar.gz && \
  tar xf s6-overlay-amd64.tar.gz && rm s6-overlay-amd64.tar.gz && \
  rm -rf /var/lib/apt/lists

CMD ["/init"]
