FROM quay.io/untoreh/containers:alpbase

RUN apk --no-cache add etcd && \
    ETCD_VERSION=$(git ls-remote -t git://github.com/coreos/etcd.git | awk '{print $2}' | cut -d '/' -f 3 | grep -v "\-rc" | cut -d '^' -f 1 | sed 's/^v//' | sort -bt. -k1nr -k2nr -k3r -k4r -k5r | head -1) && \
    wget -q https://github.com/coreos/etcd/releases/download/v$ETCD_VERSION/etcd-v$ETCD_VERSION-linux-amd64.tar.gz -O etcd.zip & \
    tar xf etcd.zip && \
    mkdir -p usr/bin && \
    mv etcd*/etcdctl /usr/bin && \
    rm -rf etcd*

CMD ["etcd"]
