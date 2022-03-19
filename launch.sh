#!/bin/sh

rm /etc/nginx/conf.d/default.conf || :
envsubst \$NGINX_PORT,\$NGINX_HOST,\$FORWARD_HOST,\$FORWARD_PORT,\$PROXY_MAX_TEMP_FILE_SIZE < auth.conf > /etc/nginx/conf.d/auth.conf
envsubst < auth.htpasswd > /etc/nginx/auth.htpasswd

nginx -g "daemon off;"
