#!/usr/bin/env bash
set -e

cd ~/SimpleApplication

npm install

pm2 stop simple_app || true
pm2 delete simple_app || true
pm2 start ./bin/www --name simple_app
pm2 save