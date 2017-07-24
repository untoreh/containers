#!/bin/bash
# https://github.com/docker-library/healthcheck/blob/master/postgres/docker-healthcheck
set -eo pipefail
up=""

user="${POSTGRES_USER:-postgres}"

args=(
        --quiet --no-align --tuples-only
)

while [ -z "$up" ]; do
	if select="$(su postgres -c 'psql --quiet --no-align --tuples-only -c "SELECT 1;"')" && [ "$select" = '1' ]; then
		up=true
	fi
	sleep 1
done
psql -c "CREATE EXTENSION citus;"
