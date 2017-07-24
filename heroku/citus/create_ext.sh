#!/bin/bash -i
# https://github.com/docker-library/healthcheck/blob/master/postgres/docker-healthcheck
set -eo pipefail
up=""

user="${POSTGRES_USER:-postgres}"

args=(
        --quiet --no-align --tuples-only
)

## psql if psql fails it is possibly a matter of users
while [ -z "$up" ]; do
	if select="$(su postgres -c 'psql --quiet --no-align --tuples-only -c "SELECT 1;"')" && [ "$select" = '1' ]; then
		up=true
	fi
	sleep 1
done
su postgres -c 'psql -c "CREATE EXTENSION citus;"'