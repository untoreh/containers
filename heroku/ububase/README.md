## Base ubuntu image for unprivileged dynos
- `dropbear` for ssh
- `busybox` installed on `/bin` which should be the last path to not take precedence over gnu bins

## Env Vars
- `SSH_KEY` a pub key for ssh