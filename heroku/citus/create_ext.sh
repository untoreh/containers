#!/bin/bash -i
# https://github.com/docker-library/healthcheck/blob/master/postgres/docker-healthcheck
set -eo pipefail
up=""
cdb=""

user="${POSTGRES_USER:-postgres}"
host="127.0.0.${HKKN}"

args=(
        --quiet --no-align --tuples-only
)

## psql if psql fails it is possibly a matter of users
while [ -z "$up" ]; do
	if select="$(psql -h $host --quiet --no-align --tuples-only -c "SELECT 1;")" && [ "$select" = '1' ]; then
		up=true
		psql -h $host -U dyno -c "CREATE EXTENSION citus;"
		exit 
	else
		if [ -z "$cdb" ]; then
			createdb -h $host && \
			createuser -h $host --createdb --createrole --role=$(whoami) --superuser --replication dyno && \
			createdb -h $host -U dyno dyno && \
			cdb=true
		fi
	fi
	sleep 1
done