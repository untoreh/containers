#!/usr/bin/with-contenv sh

c=1
for EP in $ENDPOINTS; do
    srv_dir=/etc/services.d/chisel-client-${c}
    mkdir -p $srv_dir
    cat <<EOF > ${srv_dir}/run
#!/bin/sh

exec chisel client ${EP} 127.0.0.${c}:${EP_PORT}:127.0.0.1:${EP_PORT}
EOF
    chmod +x ${srv_dir}/run
    c=$((c+1))
done