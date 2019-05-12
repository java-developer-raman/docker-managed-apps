#!/usr/bin/env bash

echo "Substitute environment variables"
envsubst '$PROXY_PROTOCOL, $PROXY_UPSTREAM' < /etc/nginx/sites-available/default.template > /etc/nginx/sites-available/default

# To make nginx a process with id 1, Call it with exec, Since without it, shell is not forwarding any signal to nginx process and it is not exiting with ctrl + c
echo "Starting nginx"
exec nginx -g 'daemon off;'