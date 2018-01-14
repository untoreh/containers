#!/usr/bin/with-contenv sh

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    export HOME=${HOME:-/home/default} USER_NAME=${USER_NAME:-default}
    echo "${USER_NAME}:x:$(id -u):0:${USER_NAME} user:${HOME}:/bin/sh" >> /etc/passwd
    mkdir -p ${HOME}
  fi
fi
