FROM untoreh/ububase

ENV DAEMONIZED=true WORKERS=32 THREADS=32 METATHREADS=64 REMOTEFSYNC=false

RUN wget -q http://www.beegfs.com/release/latest-stable/gpg/DEB-GPG-KEY-beegfs -O- | apt-key add - && \
    wget -qP /etc/apt/sources.list.d http://www.beegfs.com/release/latest-stable/dists/beegfs-deb8.list && \
    apt update && apt install -yq beegfs-mgmtd beegfs-meta beegfs-storage beegfs-helperd && \
    apt download  beegfs-client && dpkg --force-depends -i beegfs-client* && rm beegfs-client* -f && \
    `## foreground option and some tweaks` && \
    sed -r 's/(runDaemonized)(.*=.*)false/\1\2'$DAEMONIZED'/' -i /etc/beegfs/beegfs-mgmtd.conf && \
    sed -r 's/(runDaemonized)(.*=.*)false/\1\2'$DAEMONIZED'/' -i /etc/beegfs/beegfs-meta.conf && \
    sed -r 's/(runDaemonized)(.*=.*)false/\1\2'$DAEMONIZED'/' -i /etc/beegfs/beegfs-storage.conf && \
    sed -r 's/(runDaemonized)(.*=.*)false/\1\2'$DAEMONIZED'/' -i /etc/beegfs/beegfs-helperd.conf && \
    sed -r 's/tuneRemoteFSync(.*=.*)false/tuneRemoteFSync\1'$REMOTEFSYNC'/' -i /etc/beegfs/beegfs-client.conf && \
    sed -r 's/(connMaxInternodeNum.*=[\s ]*)([0-9]+)/\1'$THREADS'/' -i /etc/beegfs/beegfs-client.conf && \
    sed -r 's/(connMaxInternodeNum.*=[\s ]*)([0-9]+)/\1'$METATHREADS'/' -i /etc/beegfs/beegfs-meta.conf && \
    sed -r 's/(connMaxInternodeNum.*=[\s ]*)([0-9]+)/\1'$THREADS'/' -i /etc/beegfs/beegfs-storage.conf && \
    sed -r 's/(tuneNumWorkers.*=[\s ]*)([0-9]+)/\1'$WORKERS'/' -i /etc/beegfs/beegfs-helperd.conf && \
    sed -r 's/(tuneNumWorkers.*=[\s ]*)([0-9]+)/\1'$WORKERS'/' -i /etc/beegfs/beegfs-meta.conf && \
    sed -r 's/(tuneNumWorkers.*=[\s ]*)([0-9]+)/\1'$WORKERS'/' -i /etc/beegfs/beegfs-mgmtd.conf && \
    sed -r 's/(tuneNumWorkers.*=[\s ]*)([0-9]+)/\1'$WORKERS'/' -i /etc/beegfs/beegfs-storage.conf && \
 && rm -rf /var/cache/apt/*

CMD ["/entrypoint.sh"]


