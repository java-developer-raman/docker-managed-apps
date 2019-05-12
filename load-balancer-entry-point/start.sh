#!/usr/bin/env bash

echo "Substitute environment variables"
envsubst '$PROXY_PROTOCOL, $PROXY_UPSTREAM' < /etc/nginx/sites-available/default.template > /etc/nginx/sites-available/default

echo "Executing custom command passed through CLI or command passed through CMD in dockerimage"
# To make nginx a process with id 1, Call it with exec, Since without it, shell is not forwarding any signal to nginx process and it is not exiting with ctrl + c
"$@"