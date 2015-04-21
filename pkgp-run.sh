#!/bin/bash

sed -i "s/%%%SERVER_NAME%%%/${SERVER_NAME}/g" /etc/nginx/sites-enabled/ssl

exec nginx -g daemon off;
