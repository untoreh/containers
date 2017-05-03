FROM untoreh/ububase

ENV DAEMONIZED=false WORKERS=32 THREADS=32 METATHREADS=64 REMOTEFSYNC=false \
    INODES_LOW=1M INODES_EMR=64K META_LOW=1G META_EMR=64M SPC_LOW=5G SPC_EMR=512M

RUN wget -q http://www.beegfs.com/release/latest-stable/gpg/DEB-GPG-KEY-beegfs -O- | apt-key add - && \
    wget -qP /etc/apt/sources.list.d http://www.beegfs.com/release/latest-stable/dists/beegfs-deb8.list && \
    apt update && apt install -yq beegfs-mgmtd beegfs-meta beegfs-storage beegfs-helperd && \
    apt download  beegfs-client && dpkg --force-depends -i beegfs-client* && rm beegfs-client* -f && \
    `## foreground option and some tweaks` && \
    sed -r 's/(runDaemonized)(.*=.*)true/\1\2'$DAEMONIZED'/' -i /etc/beegfs/beegfs-mgmtd.conf && \
    sed -r 's/(runDaemonized)(.*=.*)true/\1\2'$DAEMONIZED'/' -i /etc/beegfs/beegfs-meta.conf && \
    sed -r 's/(runDaemonized)(.*=.*)true/\1\2'$DAEMONIZED'/' -i /etc/beegfs/beegfs-storage.conf && \
    sed -r 's/(runDaemonized)(.*=.*)true/\1\2'$DAEMONIZED'/' -i /etc/beegfs/beegfs-helperd.conf && \
    sed -r 's/tuneRemoteFSync(.*=.*)false/tuneRemoteFSync\1'$REMOTEFSYNC'/' -i /etc/beegfs/beegfs-client.conf && \
    sed -r 's/(connMaxInternodeNum.*=[\s ]*)([0-9]+)/\1'$THREADS'/' -i /etc/beegfs/beegfs-client.conf && \
    sed -r 's/(connMaxInternodeNum.*=[\s ]*)([0-9]+)/\1'$METATHREADS'/' -i /etc/beegfs/beegfs-meta.conf && \
    sed -r 's/(connMaxInternodeNum.*=[\s ]*)([0-9]+)/\1'$THREADS'/' -i /etc/beegfs/beegfs-storage.conf && \
    sed -r 's/(tuneNumWorkers.*=[\s ]*)([0-9]+)/\1'$WORKERS'/' -i /etc/beegfs/beegfs-helperd.conf && \
    sed -r 's/(tuneNumWorkers.*=[\s ]*)([0-9]+)/\1'$WORKERS'/' -i /etc/beegfs/beegfs-meta.conf && \
    sed -r 's/(tuneNumWorkers.*=[\s ]*)([0-9]+)/\1'$WORKERS'/' -i /etc/beegfs/beegfs-mgmtd.conf && \
    sed -r 's/(tuneNumWorkers.*=[\s ]*)([0-9]+)/\1'$WORKERS'/' -i /etc/beegfs/beegfs-storage.conf && \
    sed -r 's/(tuneMetaInodesLowLimit.*=[\s ]*)(.*+)$/\1'$INODES_LOW'/' -i /etc/beegfs/beegfs-mgmtd.conf && \
    sed -r 's/(tuneMetaInodesEmergencyLimit.*=[\s ]*)(.*+)$/\1'$INODES_EMR'/' -i /etc/beegfs/beegfs-mgmtd.conf && \
    sed -r 's/(tuneMetaSpaceLowLimit.*=[\s ]*)(.*+)$/\1'$SPC_LOW'/' -i /etc/beegfs/beegfs-mgmtd.conf && \
    sed -r 's/(tuneMetaSpaceEmergencyLimit.*=[\s ]*)(.*+)$/\1'$SPC_EMR'/' -i /etc/beegfs/beegfs-mgmtd.conf && \
    sed -r 's/(tuneStorageInodesLowLimit.*=[\s ]*)(.*+)$/\1'$INODES_LOW'/' -i /etc/beegfs/beegfs-mgmtd.conf && \
    sed -r 's/(tuneStorageInodesEmergencyLimit.*=[\s ]*)(.*+)$/\1'$INODES_EMR'/' -i /etc/beegfs/beegfs-mgmtd.conf && \
    sed -r 's/(tuneStorageSpaceLowLimit.*=[\s ]*)(.*+)$/\1'$SPC_LOW'/' -i /etc/beegfs/beegfs-mgmtd.conf && \
    sed -r 's/(tuneStorageSpaceEmergencyLimit.*=[\s ]*)(.*+)$/\1'$SPC_EMR'/' -i /etc/beegfs/beegfs-mgmtd.conf

 && rm -rf /var/cache/apt/*

CMD ["/entrypoint.sh"]


