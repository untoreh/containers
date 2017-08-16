## Citus container for unprivileged heroku dynos

It is configured on start, it is therefore stateless, peers are setup through env vars.

## Env Vars

- `HKKN` node number `1-255`
- `REMOTE_PORT` port used by all the tunnels (it is the same for now, no need for different)
- `REMOTES` space separated string of node numbers e.g. `1 2 3`
- `ROUTER` domain of the router 

## Services

- `pg` the postgres server
- `chiselclient` connects to the router to allow reaching external pg servers
- inherited...