#!/usr/bin/env bash
set -e

cd ~/SimpleApplication

printf "%s" "$PRIVATE_KEY" > privatekey.pem
printf "%s" "$SERVER" > server.crt

npm install

pm2 stop simple_app || true
pm2 delete simple_app || true
pm2 start ./bin/www --name simple_app
pm2 save
